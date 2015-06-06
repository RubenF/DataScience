install.packages('data.table',repos='http://cran.r-project.org')
install.packages('xlsx',repos='http://cran.r-project.org')
install.packages('XML',repos='http://cran.r-project.org')
library(data.table)
library(xlsx)
library(XML)
packages <- c("data.table", "xlsx", "XML")
sapply(packages, require, character.only = TRUE, quietly = TRUE)
setInternet2(TRUE)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
f <- file.path(getwd(), "PUMSDataDict06.pdf")
download.file(url, f, mode = "wb")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
f <- file.path(getwd(), "ss06hid.csv")
download.file(url, f)
dt <- data.table(read.csv(f))
setkey(dt, VAL)
dt[, .N, key(dt)]
