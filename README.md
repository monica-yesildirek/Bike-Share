# Cyclistic Bike-Share Case Study
<img src='https://miro.medium.com/max/586/1*ddC1KfTAHBXjmGseS2drRw.png' height='210' align="right" />

#### Author: [Monica Yesildirek](https://www.linkedin.com/in/monica-yesildirek/)
#### Date Created: March 2022
#### Status: Complete
#### Project Type: ETL, Descriptive Statistics, Analysis, Visualization
#### Case Study Source: [Cyclistic Bike-Share](https://d18ky98rnyall9.cloudfront.net/aacF81H_TsWnBfNR_x7FIg_36299b28fa0c4a5aba836111daad12f1_DAC8-Case-Study-1.pdf?Expires=1653955200&Signature=iEtNSONA1D0~3vR8W55i2oT~zpQmK5VRFI3vFOnLc5-v4Rijl9bcAxepRrnAaBgywCeg2rj3sCP9joR9yxr5Gg~6DFwsEzbpq15J-LLZg7qGyM792-a484e1eMeS0-EHk6BvNTrGnUgU7pNpFp9cXwci7ygLmwqDswjbsH7iGSg_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A)
- - - -
## Project Purpose
### Summary
This case study was a part of the Google Data Analytics Capstone course project. The goal of the project was to use tools and concepts learned throughout the certificate to provide a beginning to end solution for the fictional stakeholder needs. Tools used in the project included R, R Studio, BigQuery, SQL in the Google Cloud Platform, and Tableau.

### Google Data Analytics Professional Certificate
The professional certificate that provided this case study can be found on [Coursera](https://www.coursera.org/professional-certificates/google-data-analytics).

#### Courses included were:
1. [Foundations: Data, Data, Everywhere](https://www.coursera.org/learn/foundations-data?specialization=google-data-analytics)
2. [Asks Questions to Make Data Driven Decisions](https://www.coursera.org/learn/ask-questions-make-decisions?specialization=google-data-analytics)
3. [Prepare Data for Exploration](https://www.coursera.org/learn/data-preparation?specialization=google-data-analytics)
4. [Process Data from Dirty to Clean](https://www.coursera.org/learn/process-data?specialization=google-data-analytics)
5. [Analyze Data to Answer Questions](https://www.coursera.org/learn/analyze-data?specialization=google-data-analytics)
6. [Share Data Through the Art of Visualization](https://www.coursera.org/learn/visualize-data?specialization=google-data-analytics)
7. [Data Analysis with R Programming](https://www.coursera.org/learn/data-analysis-r?specialization=google-data-analytics)
8. [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone?specialization=google-data-analytics)

### Project Foundation
The project organization used in this case study was learned in the Ask Questions to Make Data Driven Decisions course. The six data analysis phases used in this case study include:
1. ASK
2. PREPARE
3. PROCESS
4. ANALYZE
5. SHARE
6. ACT
- - - -
## Case Study Background 
### About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. 

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

### Stakeholders

#### Cyclistic 
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself
apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with
disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about
8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to
commute to work each day.

#### Lily Moreno 
The director of marketing and your manager. Moreno is responsible for the development of campaigns
and initiatives to promote the bike-share program. These may include email, social media, and other channels.

#### Cyclistic marketing analytics team 
A team of data analysts who are responsible for collecting, analyzing, and
reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy
learning about Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic
achieve them.

#### Cyclistic executive team 
The notoriously detail-oriented executive team will decide whether to approve the
recommended marketing program.

- - - -
## ASK - Identify Business Task
### Stakeholder Needs
Moreno has set a clear goal, design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
### Business Task
#### Questions to Answer
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

#### Project Deliverables
- [ ] A clear statement of the business task
- [ ] A description of all data sources used
- [ ] Documentation of any cleaning or manipulation of data
- [ ] A summary of your analysis
- [ ] Supporting visualizations and key findings
- [ ] Your top three recommendations based on your analysis

### Completed Deliverable
- [x] A clear statement of the business task
- - - -
## PREPARE - Data Extraction and Evaluation
### About the Data
- Data Source: https://divvy-tripdata.s3.amazonaws.com 
- Data Location: Amazon Web Services Site
- Data Owner: Made Available by Motivate International Inc.
- Licensing: https://ride.divvybikes.com/data-license-agreement
- Data layout: Structured
- Clean: No

### Data Extraction
The complete extract process and explanation can be found at `Bike-Share/1 - Extract/Extract.R` In this step, data was extracted using a web scraping method in R Studio with the `rvest` library.

### Completed Deliverable
The Cyclistic trip data was evaluated and found useful for analysis. A license from Motivate International Inc. indicates that the data is usable for the purpose of this project. After extraction, it was found that the data will need transformation and cleaning, but overall is sufficient for use in this project. No additional data sources were needed.

- [x] A description of all data sources used

- - - -
## PROCESS - Data Transformation and Loading

### Data Cleaning and Storage
The complete process and explanation can be found at `Bike-Share/2 - Transform and Load/Transform_Load.R`. In this step, data was transformed using R then loaded to the Google Cloud Platform using the `bigrquery` library in R.

### Completed Deliverable
Data was cleaned in R and imported to BigQuery in the Google Cloud Platform for team accessibility and SQL query. 

- [x] Documentation of any cleaning or manipulation of data
- - - -
## ANALYZE and SHARE - Analysis and Visualizations

### Analysis
Descriptive statistics were used to determine key differences between Cyclistic members and casual riders by day of the week and by month. Visualizations simplified analysis and the use of Tableau provided a means to share and update results.

### Tableau Results
Data was uploaded from BigQuery to Tableau Desktop and analyzed through visualizations. 
Click [here](https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic) to view the the interactive dashboard.

<a href="https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic" target="blank">
<img src="https://user-images.githubusercontent.com/94379757/171060229-935371a7-d60d-4ca1-8eff-b4a2ac4070f2.JPG" alt="Cyclistic Bike Share" width="920"/> </a>

<a href="https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic" target="blank">
<img src="https://user-images.githubusercontent.com/94379757/171060245-1a1fae74-6a39-449c-aa34-18cd8f8c9201.JPG" alt="Cyclistic Bike Share" width="920"/> </a>

<a href="https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic" target="blank">
<img src="https://user-images.githubusercontent.com/94379757/171060254-49536e80-27a5-4cef-a5fa-1ae16f77f9f2.JPG" alt="Cyclistic Bike Share" width="920"/> </a>

<a href="https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic" target="blank">
<img src="https://user-images.githubusercontent.com/94379757/171060262-1e742481-bac6-4ad4-8f9a-5c70c763f11c.JPG" alt="Cyclistic Bike Share" width="920"/> </a>

<a href="https://public.tableau.com/app/profile/monica.yesildirek/viz/CyclisticBikeShare_16538424597080/Cyclistic" target="blank">
<img src="https://user-images.githubusercontent.com/94379757/171060276-fc3bb1e7-d2fe-48a7-8d24-a4d543024c67.JPG" alt="Cyclistic Bike Share" width="920"/> </a>

### Completed Deliverable
- [x] A summary of your analysis
- [x] Supporting visualizations and key findings
- - - -
## ACT - Recommendations

### Questions Answered
#### 1. How do annual members and casual riders use Cyclistic bikes differently?
- Casual riders ride mostly on Saturdays and Sundays from June to September
- Members ride mostly on weekdays
- Casual riders spend more than double the time riding than members
- Member ride length is fairly consistent all year
- Both members and casual riders prefer classic bikes

#### 2. Why would casual riders buy Cyclistic annual memberships?
- Rides occur consistently beginning in May to about October
- Casual riders spend more time on each bike ride than members
- Rides seem to be leisurely since they are longer and on the weekends

#### 3. How can Cyclistic use digital media to influence casual riders to become members?
- Consider timing of advertisements 
- Focus on leisurely riding as a marketing theme
- Use preferred bikes in advertisements

### Marketing Strategy
The digital marketing team should begin running ads ahead of summer and avoid spending funds prior to spring and after summer. Advertisements should focus on the leisurely aspect of bike riding. Since casual riders prefer classic bikes, they should be included in any marketing materials.

### Completed Deliverable
- [x] Your top three recommendations based on your analysis
- - - -

