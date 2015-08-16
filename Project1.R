#Loading Libraries
library("dplyr")
# Getting the data
#Defining URL and file names
url<-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
filez<-"repdata-data-activity.zip"
filec<-"activity.csv"

#Downloading and saving the file
download.file(url,filez)

#Extracting the data file from the zip file
unzip("repdata-data-activity.zip")

#Reading the data
data<-read.csv(filec)

#Filter lines with missing values
data<-data[complete.cases(data),]

#Sumarize data per day
byday <- data %>% group_by(date)
suma<-byday %>% summarise_each(funs(sum))
#plot Histogram of total number of step taken each day
hist(suma$steps)

#Calculate and report the mean and median of the total number of steps taken per day
mean(suma$steps)
median(suma$steps)

#Recalculating with missing values
#Reading the data
data<-read.csv(filec)

#Count rows with missing values
sum(is.na(data$steps))

#calculating means per day
dataf<-data[complete.cases(data),]
mbyday <- dataf %>% group_by(date)
mn<-mbyday %>% mutate_each(funs(mean))
#
