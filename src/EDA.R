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

dep_delay_cat <- cut(flights_df$dep_delay,
                     breaks = c(-45,-1,0,30,120,1301),
                     labels = c("Before Time",
                                "On Time",
                                "Low Delay (less than 30 min)",
                                "Medium Delay (31-120 min)",
                                "High Delay (more than 121 min)"))

arr_delay_cat <- cut(flights_df$arr_delay,
                     breaks = c(-88,-1,0,30,120,1272),
                     labels = c("Before Time",
                                "On Time",
                                "Low Delay (less than 30 min)",
                                "Medium Delay (31-120 min)",
                                "High Delay (more than 121 min)"))

dep_plot <- ggplot(flights_df, aes(dep_delay_cat)) +
  geom_bar() +
  geom_text(aes(label= scales::percent(after_stat(as.double(prop))), group=1),
            stat='count', vjust = -0.3,) +
  scale_x_discrete(guide = guide_axis(n.dodge=2))+
  labs(title="Percentage of NYC Flights Departure Delay (2013)",
       x = "Departue Delay Time",
       y = "Number of Departure Delays")


arr_plot <- ggplot(flights_df, aes(arr_delay_cat)) +
  geom_bar() +
  geom_text(aes(label= scales::percent(after_stat(as.double(prop))), group=1),
            stat='count', vjust = -0.3, ) +
  scale_x_discrete(guide = guide_axis(n.dodge=2))+
  labs(title="Percentage of NYC Flights Arrival Delay (2013)",
       x = "Arrival Delay Time",
       y = "Number of Arrival Delays")


grid.arrange(dep_plot, arr_plot, ncol = 2)


#SHAIMAA