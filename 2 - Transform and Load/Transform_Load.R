#============================================
#Title: GOOGLE ANALYTICS CASE STUDY
#Purpose: Transform & Load
#Data: cyclistic trip data (03/2021-02/2022)
#By: Monica Yesildirek
#============================================

#BigQuery library if needed
#devtools::install_github("rstats-db/bigrquery")

#import libraries
library(tidyverse)
library(lubridate)
library(bigrquery)

#============================================
#STEP 2: TRANSFORM DATA
#============================================

#bind 12 months of data into one data frame
cyclistic_trips = do.call("rbind.data.frame", cyclistic_trips)

#clean file_date column
cyclistic_trips$file_date = sub("\\-.*","", cyclistic_trips$file_date)
cyclistic_trips$file_date = as_date(ym(cyclistic_trips$file_date))
cyclistic_trips$file_date = format(as.Date(cyclistic_trips$file_date), "%Y-%m")

#change "start_at" and "end_at" columns to datetime format
cyclistic_trips = cyclistic_trips |>
  mutate_at(vars(contains("_at")), as.POSIXct)

#calculate trip time 
cyclistic_trips$ride_length = difftime(cyclistic_trips$ended_at, cyclistic_trips$started_at, units = 'secs')

#Create a column called "day_of_week"
cyclistic_trips$day = wday(cyclistic_trips$started_at, label = T, abbr = F)

#reorder columns data
cyclistic_trips = cyclistic_trips[,c(13, 2, 1, 14, 16, 15, 3:12)]

#change difftime to numeric column
cyclistic_trips$ride_length = as.numeric(cyclistic_trips$ride_length)

#convert to list by file dates
cyclistic_trips = cyclistic_trips |>
  group_split(file_date)

#rename data frames for BigQuery upload
bq_names = c("Mar_2021", "Apr_2021", "May_2021", "Jun_2021", "Jul_2021", "Aug_2021",
                "Sep_2021", "Oct_2021", "Nov_2021", "Dec_2021", "Jan_2022", "Feb_2022") 
names(cyclistic_trips) = bq_names

#============================================
#STEP 2: LOAD DATA
#============================================

#split data frames
list2env(cyclistic_trips, envir=.GlobalEnv)

#upload data frames to google cloud platform
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-03", Mar_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-04", Apr_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-05", May_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-06", Jun_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-07", Jul_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-08", Aug_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-09", Sep_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-10", Oct_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-11", Nov_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2021-12", Dec_2021)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2022-01", Jan_2022)
insert_upload_job("gda-case-study-1-032022", "cyclistic", "2022-02", Feb_2022)
