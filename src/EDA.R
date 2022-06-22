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
flights_df <- flights_df %>% drop_na()
colSums(is.na(flights_df))

#TURKI
library(ggplot2)

# PLOT 1
# distribution of flights per month
flights %>% 
  group_by(month) %>% 
  summarise(n = n())

ggplot(flights, aes(x = as.factor(month))) +
  geom_bar(stat = "count")

# we can see that all month are similar with 
# min = 24951 (feb) and max = 29425 (jul)


# PLOT 2
# origin vs no of flights
flights %>% 
  group_by(origin) %>% 
  summarise(count_flights = n()) %>% # % of flights
  ggplot(aes(x= origin, y = count_flights)) +
  geom_col()


# # PLOT 3
# # origin vs dep_delay
# flights %>% 
#   group_by(origin) %>% 
#   summarise(dep_delay = sum(dep_delay) / n()) %>% # % of flights
#   ggplot(aes(x= origin, y= dep_delay)) +
#   geom_col()
# 
# # PLOT 4
# # origin vs arr_delay
# flights %>% 
#   group_by(origin) %>% 
#   summarise(arr_delay = sum(arr_delay) / n()) %>% # % of flights
#   ggplot(aes(x= origin, y= arr_delay)) +
#   geom_col()

# PLOT 5
# origin vs arr_delay / dep_delay
flights %>% 
  drop_na() -> flights

flights %>% 
  select(origin, is.na(arr_delay), is.na(dep_delay)) %>% 
  pivot_longer(-c(origin)) -> plot5

plot5 %>% 
  group_by(origin, name) %>% 
  summarise(sum(value))

ggplot(plot5, aes(origin, value, fill = name)) +
  geom_bar(stat='identity', position = "dodge")
## use filter? 

# PLOT 6
# dest vs arr_delay / dep_delay
flights %>% 
  drop_na() -> flights

flights %>% 
  select(dest, dep_delay) %>% 
  pivot_longer(-c(dest)) -> plot6

plot6 %>% 
  group_by(dest, name) %>% 
  summarise(sum(value))

ggplot(plot6, aes(dest, value, fill = name)) +
  geom_bar(stat='identity', position = "dodge")
#MAAN
library(ggplot2)

# dep_delay by day-time (hours)
flights_df <- flights_df %>% 
  drop_na()


flights_df %>%
  filter(dep_delay > 0) %>%
  count(hour, dep_delay) %>% 
  ggplot(aes(hour, dep_delay)) +
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


# total flights stack

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
# We'll use the correlation matrix
all_df <- subset(flights_df, 
                 select = c(dep_time, sched_dep_time, dep_delay,
                            arr_time, sched_arr_time, arr_delay,
                            air_time, distance) )

all_matrix <- cor(all_df, use = "complete.obs")

library(corrplot)
corrplot(all_matrix, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45, diag = FALSE, method = "number")

flights_df %>%
  slice_max(arr_delay) -> most_arr_delay

flights_df %>%
  slice_max(dep_delay) -> most_dep_delay

glimpse(most_arr_delay)
glimpse(most_dep_delay)

#YOSUF

#SHAIMAA
