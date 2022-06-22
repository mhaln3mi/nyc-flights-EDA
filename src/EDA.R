# Install the package
# install.packages("nycflights13")

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

#MAAN

#SAAD

#YOUSEF

library("gridExtra")  

flights_df1 <- flights_df

flights_df1$dep_delay_cat <- cut(flights_df1$dep_delay,
                     breaks = c(-45,-1,0,15,60,1301),
                     labels = c("Before Time",
                                "On Time",
                                "Low Delay (less than 15 min)",
                                "Medium Delay (16-60 min)",
                                "High Delay (more than 60 min)"))

flights_df1$arr_delay_cat <- cut(flights_df1$arr_delay,
                     breaks = c(-88,-1,0,15,60,1272),
                     labels = c("Before Time",
                                "On Time",
                                "Low Delay (less than 15 min)",
                                "Medium Delay (16-60 min)",
                                "High Delay (more than 61 min)"))

dep_plot <- ggplot(flights_df1, aes(dep_delay_cat)) +
  geom_bar() +
  geom_text(aes(label= scales::percent(after_stat(as.double(prop))), group=1),
            stat='count', vjust = -0.3,) +
  scale_x_discrete(guide = guide_axis(n.dodge=2))+
  labs(title="Percentage of NYC Flights Departure Delay (2013)",
       x = "Departue Delay Time",
       y = "Number of Departure Delays")


arr_plot <- ggplot(flights_df1, aes(arr_delay_cat)) +
  geom_bar() +
  geom_text(aes(label= scales::percent(after_stat(as.double(prop))), group=1),
            stat='count', vjust = -0.3, ) +
  scale_x_discrete(guide = guide_axis(n.dodge=2)) +
  labs(title="Percentage of NYC Flights Arrival Delay (2013)",
       x = "Arrival Delay Time",
       y = "Number of Arrival Delays")

grid.arrange(dep_plot, arr_plot, ncol = 2)

flights_df1 %>% 
  group_by(carrier) %>%
  summarise(no_flights = n()) %>%
  arrange(-no_flights)

flights_pos_delay <- flights_df1 %>%
  filter(dep_delay > -1)

ggplot(flights_pos_delay, aes(y = carrier, fill = dep_delay_cat)) +
  geom_bar()

# We can see that top 4 carriers having a high frequency of delay are 
# UA, EV, B6 and DL. These carriers also have the highest frequency of 
# dep_delay more than 60 min.

flights_df1 %>%
  group_by(carrier) %>%
  summarise(highest_delay = max(dep_delay), avg_delay = mean(dep_delay),
            delays_higher_than_120min = sum(dep_delay > 120)) %>%
  arrange(-avg_delay)

#SHAIMAA