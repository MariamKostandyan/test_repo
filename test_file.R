### Author: MK
### Report Marianne Aug 2021

#####---------------clear the working directory---------------#####
rm(list=ls()) 


####---------------import libraries---------------#####
#library(PerformanceAnalytics)
library("xlsx")
library(readxl)
library(plyr)
library(Rmisc)
library(ggplot2)
library(wesanderson)
library(dplyr)
library(ggforce)
library(tidyr)
library(data.table)
library(reactable)
library(reactablefmtr)


####---------------setting up the path---------------####
myPath <- "C:/Users/MK0008/OneDrive - ELIA GROUP/Reports/Marianne Aug 2021"
setwd(myPath)


####---------------importing the right file---------------####
df <- read.csv("report_Value___Behaviour_rating_Edited.csv", header = TRUE, fill=TRUE, sep = ",", quote = "\"'",
               dec = ".",
               na.strings = "NaN", colClasses = NA, nrows = -1,
               fileEncoding = "UTF-8",
               skip = 0, check.names = TRUE,
               strip.white = FALSE, blank.lines.skip = TRUE,
               comment.char = "#",
               allowEscapes = FALSE, flush = FALSE)
