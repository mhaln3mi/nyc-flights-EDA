
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
dep_df <- subset(flights_df, 
                select = c(dep_time, sched_dep_time, dep_delay, air_time, distance) )

arr_df <- subset(flights_df, 
                select = c(arr_time, sched_arr_time, arr_delay, air_time, distance) )

delays_df <- subset(flights_df, 
                 select = c(dep_delay, arr_delay, air_time, distance) )

time_df <- subset(flights_df, 
                 select = c(dep_time, sched_dep_time,
                            arr_time, sched_arr_time,
                            air_time, distance) )

delays_matrix <- cor(delays_df, use = "complete.obs")
delays_matrix

time_matrix <- cor(time_df, use = "complete.obs")
time_matrix

library(corrplot)

corrplot(delays_matrix, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, diag = FALSE, method = "number")

corrplot(time_matrix, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, diag = FALSE, method = "number")


ggplot(flights_df, aes(distance, arr_delay)) +
  geom_jitter()

ggplot(flights_df, aes(distance, dep_delay)) +
  geom_jitter()

ggplot(flights_df, aes(air_time, arr_delay)) +
  geom_jitter()

ggplot(flights_df, aes(air_time, dep_delay)) +
  geom_jitter()

flights_df %>%
  slice_max(arr_delay) -> most_arr_delay

flights_df %>%
  slice_max(dep_delay) -> most_dep_delay

glimpse(most_arr_delay)
most_dep_delay

#YOSUF

#SHAIMAA