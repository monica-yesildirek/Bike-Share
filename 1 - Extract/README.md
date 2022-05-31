
# 1 - Data Extraction
`Extract.R` was created and used to extract 12 `.csv` files from an Amazon Web Services site into a temporary directory. The resulting data frame of 5,667,986 observations with 14 columns was then saved locally as a backup raw data file. 
The following describes that process:

### AWS Web Scraping
In this step, data was extracted using a web scraping method in *R Studio* with the `rvest` library.

First, the library rvest needs to be called:
```r
library(rvest)
```

Next, the file names were retrieved from the Amazon Web Services site:
```r
#scrape file names from AWS
url = "https://divvy-tripdata.s3.amazonaws.com" 
page = read_html(url) 
file_zips = html_elements(page, "key") |> html_text()
```
Now, `file_zips` contains the file names of the entire list of `.zip` files on the website. However, only the last 12 months of data is needed. As shown below, the list currently contains 42 items:

![image](https://user-images.githubusercontent.com/94379757/161093262-f1d61c97-a508-4215-927e-e2f1f0a4a086.png)

### Downloading the Required Files

To pull only the needed files, the quarterly reports were excluded from the list. From there, the last 12 months were extracted using `tail()`:   
```r
#select the 12 most recent months
file_zips = file_zips[1:23]
file_zips = tail(file_zips, 12)
```
The results were then verified:

![image](https://user-images.githubusercontent.com/94379757/161093752-f9a082e3-6131-4500-97be-b17ba7f7386a.png)

So far, only the names have been extracted, but the files still need to be downloaded. To cycle through all the file names, a `for` loop was used to download the files into a temporary folder:

```r
#download files into temporary folder
setwd(tempdir())
file_links = paste(url, "/", file_zips, sep = "")
for(i in seq_along(file_links)){
  download.file(file_links[i], file_zips[i])
}
```
As you can see from the timestamp, this process only takes a few seconds: 
![image](https://user-images.githubusercontent.com/94379757/161095815-9a04d9dc-fce5-424f-852e-c9b9de5e8c67.png)

### Unzipping the Files

Next, the `.zip` files need to be unzipped: 
```r
#unzip files into temporary folder 
file_paths = paste(tempdir(), "\\", file_zips, sep = "")
sapply(file_paths, unzip)
```
The `.csv` files have now been extracted into the temporary folder:
![image](https://user-images.githubusercontent.com/94379757/161096534-bc09ce28-d141-4644-8d10-baf66f0e1a51.png)

### Importing Files into R

A function was created to read the files into *R Studio* as a list. A new column, `file_date`, was created in each data frame to indicate the file source of each row:

```r
#read csvs from temporary folder into a list
file_csvs = dir(tempdir(), "*..csv$")
cyclistic_trips = lapply(file_csvs, function(i){
  x = read.csv(i)
  #add column using file name 
  x$file_date = i
  x
})
```

The list is 1.8 GB. The data is verified to ensure each data frame contains the same number of columns and column names. As shown, each of the 12 `.csv` contain 14 columns:

![image](https://user-images.githubusercontent.com/94379757/161101932-4d5960a6-8fc8-4ff4-a383-232826b7e7dd.png)

Next, all the data frames were combined into a single data frame:
```r
#bind 12 months of data into one data frame
cyclistic_trips = do.call("rbind.data.frame", cyclistic_trips)
```

An initial look at the data indicates there are 5,667,986 observations of 14 variables or columns. A quick visual inspection finds transformation of the data will be needed:
![image](https://user-images.githubusercontent.com/94379757/161107897-1fd65c7a-a532-428f-9a22-bf8096fb433c.png)


### Clearing Temporary Folder and Environment

Now that the extraction process is complete, the temporary folder and the environment can be cleared:
```r
#unlink from temporary folder
unlink(tempdir(), recursive = TRUE)

#clear environment except Cyclistic data
rm(list = setdiff(ls(), "cyclistic_trips"))
```
