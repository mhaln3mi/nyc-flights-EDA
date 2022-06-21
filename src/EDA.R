
# Install the package
install.packages("nycflights13")

# Initialize the libraries
library(nycflights13)
library(tidyverse)


flights -> flights_df

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


#MAAN

#SAAD

#YOSUF

#SHAIMAA