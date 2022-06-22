
# Install the package
install.packages("nycflights13")

# Initialize the libraries
library(nycflights13)
library(tidyverse)
library(janitor)

flights -> flights_df
flights_df

glimpse(flights_df)
summary(flights_df)

# Checking for duplicates.
get_dupes(flights_df)

# Checking for null values.
is.null(flights_df)

#TURKI

#MAAN

#SAAD

# What are the observations/attributes that influence dep_delay or arr_delay 
# to be high or low? (mention scale/threshold used) 

# We'll use the correlation matrix
dep_df = subset(flights_df, 
                select = c(dep_time, sched_dep_time, dep_delay, air_time, distance) )

arr_df = subset(flights_df, 
                select = c(arr_time, sched_arr_time, arr_delay, air_time, distance) )

dep_matrix <- cor(dep_df, use = "complete.obs")
dep_matrix

arr_matrix <- cor(arr_df, use = "complete.obs")
arr_matrix

library(corrplot)
corrplot(dep_matrix, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)


#YOSUF

#SHAIMAA