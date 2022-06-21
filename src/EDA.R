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

#MAAN

#SAAD

#YOUSEF

dep_delay_cat <- cut(flights_df$dep_delay,
                     breaks = c(-43,-1,0,30,120,1301),
                     labels = c("Before Time",
                                "On Time",
                                "Low Delay (less than 30 min)",
                                "Medium Delay (31-120 min)",
                                "High Delay (more than 121 min)"))

 ggplot(flights_df, aes(dep_delay_cat)) +
  geom_bar() +
  geom_text(aes(label= scales::percent(after_stat(as.double(prop))), group=1),
    stat='count', vjust = -0.3, 
  ) 

#SHAIMAA