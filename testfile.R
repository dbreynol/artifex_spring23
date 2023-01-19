


library(nycflights13)
library(tidyverse)
library(lubridate)

flights %>% 
  group_by(year, month, day) %>% 
  summarise(n_cancel = sum(is.na(dep_time)), n = n()) %>% 
  mutate(prop_cancel = n_cancel/n,
         date = ymd(str_c(year,month,day, sep = "/"))) %>% 
  ggplot(aes(x = date, y = prop_cancel)) + geom_line()

flights %>% 
  mutate(date = ymd(str_c(year,month,day, sep = "/"))) %>% 
  group_by(wday(date)) %>% 
  summarise(n_cancel = sum(is.na(dep_time)), n = n()) %>% 
  mutate(prop_cancel = n_cancel/n) %>% 
  ggplot(aes(x = `wday(date)`, y = prop_cancel)) + geom_point()
  