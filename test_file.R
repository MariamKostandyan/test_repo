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

####---------------preparing the data set---------------####
unique(df$Competency.Official.Rating)
unique(df$Competency.Self.Rating)

df1 <- df #create a duplicate of the data set

#rename the ratings' values
df1$Competency.Self.Rating <- revalue(df1$Competency.Self.Rating, c("Unrated"="unrated"))
df1[df1 == ""] <- NA     
df1$Competency.Self.Rating[is.na(df1$Competency.Self.Rating)] <- "manager rated, employee did not rate"
df1$Competency.Self.Rating <- revalue(df1$Competency.Self.Rating, c("1"="development area"))
df1$Competency.Self.Rating <- revalue(df1$Competency.Self.Rating, c("2"="demonstrates the value"))
df1$Competency.Self.Rating <- revalue(df1$Competency.Self.Rating, c("3"="role model"))
df1$Competency.Self.Rating <- revalue(df1$Competency.Self.Rating, c("0"="unable to rate"))

df1$Competency.Official.Rating <- revalue(df1$Competency.Official.Rating, c("Unrated"="unrated"))
df1$Competency.Official.Rating <- revalue(df1$Competency.Official.Rating, c("1"="development area"))
df1$Competency.Official.Rating <- revalue(df1$Competency.Official.Rating, c("2"="demonstrates the value"))
df1$Competency.Official.Rating <- revalue(df1$Competency.Official.Rating, c("3"="role model"))
df1$Competency.Official.Rating <- revalue(df1$Competency.Official.Rating, c("0"="unable to rate"))

unique(df1$Competency.Official.Rating)
unique(df1$Competency.Self.Rating)

# delete unable to rate, unrated, and manager rated, employee did not rate 
df1 <- subset(df1, !Competency.Official.Rating %in% c("unable to rate", "unrated") &
                !Competency.Self.Rating %in% c("unable to rate", "unrated", "manager rated, employee did not rate"))


# subset two separate data sets about Values & Behavior 
df_behav <- subset(df1, Section.Name == "Behaviours that Make A Difference")
df_val <- subset(df1, Section.Name == "Values")

