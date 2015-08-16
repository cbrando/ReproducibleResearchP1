#Loading Libraries
library("dplyr")
library("markdown")
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
suma<-summarise(group_by(data, date), sum(steps))
#plot Histogram of total number of step taken each day
hist(suma$steps)

#Calculate and report the mean and median of the total number of steps taken per day
mean(suma$steps)
median(suma$steps)

#average daily activity pattern
inter<-summarise(group_by(data, interval), mean(steps))
names(inter)<-c("interval", "stepsmean")
plot(inter$interval,inter$stepsmean, type="l")

#Interval with maximum of steps
maxi<-max(inter$stepsmean)
maxinter<-inter[inter$stepsmean==maxi,1]

#Recalculating with missing values
#Reading the data
data<-read.csv(filec)

#Count rows with missing values
sum(is.na(data$steps))

#calculating means per day
dataf<-data[complete.cases(data),]
mbyday <- dataf %>% group_by(date)
mn<-mbyday %>% summarise_each(funs(mean))
#####
