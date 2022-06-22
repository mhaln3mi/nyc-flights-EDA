
# Install the package
install.packages("nycflights13")

# Initialize the libraries
library(nycflights13)
library(tidyverse)
library(janitor)


flights -> flights_df

glimpse(flights_df)
summary(flights_df)

# Checking for duplicates.
get_dupes(flights_df)

# Checking for null values.
is.null(flights_df)

#TURKI

#MAAN

library(ggplot2)

# dep_delay by day-time (hours)
flights_df <- flights_df %>% 
  drop_na()


flights_df %>%
  filter(dep_delay > 0) %>%
  count(hour, dep_delay) %>% 
  ggplot(aes(hour, n)) +
  geom_col() +
  labs(x = "Hour of day",
       y = "Number of Departure delay",
       title = "Number of Departure delay by hour of day")



# arr_delay by day-time (hours)

flights_df %>%
  filter(arr_delay > 0) %>%
  count(hour, arr_delay) %>% 
  ggplot(aes(hour, n)) +
  geom_col() +
  labs(x = "Hour of day",
       y = "Number of Arrival delay",
       title = "Number of Arrival delay by hour")


# dep_delay by season (months)

flights_df %>%
  filter(dep_delay > 0) %>%
  count(month, dep_delay, flight) %>% 
  ggplot(aes(month, n)) +
  geom_col() +
  labs(x = "Month",
       y = "Number of Departure delay",
       title = "Number of Departure delay by month") +
  xlim(0,12.5)

# we can see from the plot that the highest number of departure delays occur on month 6 (Jun), 7 (Jul), and 12 (Dec)
# which means there are more delays during summer and winter break.


flights_df %>%
  filter(arr_delay > 0) %>%
  count(month, arr_delay) %>% 
  ggplot(aes(month, n)) +
  geom_col() +
  labs(x = "Month",
    y = "Number of Arrival delay",
    title = "Number of Arrival delay by month") +
  xlim(0,12.5)

# similar to the previous plot, here we see highest number of arrival delays occur on month 7 (Jul), and 12 (Dec)
# during the summer and winter breaks


# facet

flights_df %>%
  count(month, dep_delay, flight) %>% 
  ggplot(aes(as.factor(month), fill = (dep_delay > 0))) +
  geom_bar(position = "stack") +
  labs(x = "Month",
       y = "Number of Flights",
       title = "Number of flights by month") +
  guides(fill = guide_legend("Departure Delay"))


flights_df %>%
  count(month, arr_delay, flight) %>% 
  ggplot(aes(as.factor(month), fill = (arr_delay > 0))) +
  geom_bar(position = "stack") +
  labs(x = "Month",
       y = "Number of Flights",
       title = "Number of flights by month") +
  guides(fill = guide_legend("Arrival Delay"))




#SAAD

#YOSUF

#SHAIMAA