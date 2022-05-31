#============================================
#Title: GOOGLE ANALYTICS CASE STUDY
#Purpose: Extract
#Data: cyclistic trip data (03/2021-02/2022)
#By: Monica Yesildirek
#============================================

#web scraping library if needed
#install.packages("rvest")

#import libraries
library(tidyverse)
library(rvest)
library(lubridate)

#============================================
#STEP 1: EXTRACT DATA
#============================================

#web scrape file names
url = ("https://divvy-tripdata.s3.amazonaws.com") 
page = read_html(url) 
file_zips = html_elements(page, "key") |> html_text()

#select the 12 most recent months
file_zips = file_zips[1:23]
file_zips = tail(file_zips, 12)

#download files into temporary folder
setwd(tempdir())
file_links = paste(url, "/", file_zips, sep = "")
for(i in seq_along(file_links)){
  download.file(file_links[i], file_zips[i])
}

#unzip files into temporary folder 
file_paths = paste(tempdir(), "\\", file_zips, sep = "")
sapply(file_paths, unzip)

#read csvs from temporary folder into a list
file_csvs = dir(tempdir(), "*..csv$")
cyclistic_trips = lapply(file_csvs, function(i){
  x = read.csv(i)
  #add column using file name 
  x$file_date = i
  x
})

#unlink from temporary folder
unlink(tempdir(), recursive = TRUE)

#clear environment except data
rm(list = setdiff(ls(), "cyclistic_trips"))
