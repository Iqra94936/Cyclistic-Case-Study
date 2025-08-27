#Load libraries
library(tidyverse)# includes dplyr ,ggplot2,readr etc.
library(lubridate) #for clean_names()
library(janitor)# for working with dates

#Set working Directory
setwd("file_path")

#Load and combine all CSVs
files <- list.files(pattern = "*.csv")

#Read all as character first (avoids errors)
all_trips <- lapply(files,function(f) {
  read.csv(f,col_types = cols(.default =
  "c")) 
})  %>%
  bind_rows() %>%
  clean_names()

#Convert columns to correct types
all_trips <- all_trips %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at = ymd_hms(ended_at),
    ride_length =
  as.numeric(difftime(ended_at,started_at,units = "mins")),
   days_of_week = wday(started_at,label = TRUE,abbr=FALSE),
  month = month(stated_at,label=TRUE,abbr=FALSE),
  year = year(started_at)
  )

#Remove bad data
all_trips <- all_trips %>%
  filter(ride_length > 0) # remove negative rides



