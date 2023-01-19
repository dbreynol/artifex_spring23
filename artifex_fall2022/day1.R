# intro to artifex
# welcome to artifex ....
# name/ major/ specific aspect of business analytics you want to know more about/ 
# favorite thing you did this past summer

# this semester's plan (retail/ international/ food services)
# groups of 3. 

# full cycle of a business analytics problem (start with 
# data cleaning, exploration, analysis, presentation)

# I'll introduce each of these phases and how to approach 
# them using R. 
# then, in teams, you will apply the methods to your Welch's 
# data. each team will need to adapt the methods to suit 
# their data

# both phases will involve learning mostly by doing things

# analysis: forecasting

# periodic update presentations to the class and to Welch's

# grading is P/F

# suppose we want to forecast the next month's orders for each customer/ product/ business unit
# today: question one of assignment 1


set.seed(1)
customer = c("113 - Shaws", "217 - Shaws", "2114 - WalMart", "99 - WalMart",
             "23 - CVS", "09 - CVS") # numbers dash name
product = c("WX1X - 9 gal - Jelly", "WX1P - 4 gal - Jelly",
            "QP1X - 11 gal - Grape Juice", "QP1 - 7 gal - Fruit Juice",
            "TYL - 1 gal - Peanut Butter", "LL - 2 gal - Jam") # letters size description
business_unit = c("123 Retail", "437 Consumer",
                  "990 International", "222 Retail",
                  "49 Consumer", "09 International") # number dash name

df = data.frame(customer, product, business_unit, 
                "1-1-2022" = rpois(6, 1100),
                "2-1-2022" = rpois(6, 1200),
                check.names = F)

library(tidyverse)
library(lubridate)

# day 2 #
pos = str_locate(customer, " - ")[,2] + 1
str_sub(customer, start = pos)

# product - what if 
str_split(product, " - ", simplify = T)

# long format

bill = billboard[,1:5]
pivot_longer(bill, cols = c("wk1", "wk2"))



head(relig_income)
pivot_longer(relig_income, cols = !religion, names_to = "income", values_to = "amount")
pivot_longer(relig_income, cols = names(relig_income)[2:11], names_to = "income", values_to = "amount")




# dealing with dates intro
dates = c("1/1/2020", "2/1/2020")
dates2 = mdy(dates)



# we will start with data cleaning/ processing. 
# in str_locate, the second argument is a "pattern" 
str_locate("QP1X - 11 gal - Grape Juice", "gal - ")
str_locate("QP1X - 11 l - Grape Juice", "gal - ") # str_split 

str_locate("QP1X - 11 l - Grape Juice", "gal - ") # str_split 


library(nycflights13)
library(tidyverse)

a = flights[1:20,]  %>%  group_by(carrier) %>% mutate(m = mean(dep_delay)) #%>% ungroup()



# one row for each combination of groupings
flights %>% 
  group_by(carrier, origin) %>% 
  summarize(m = mean(dep_delay, na.rm = T)) %>% 
  arrange(desc(m))



urlfile<-'https://raw.githubusercontent.com/dbreynol/admn510_data/main/cdc.csv'
dsin<-read.csv(url(urlfile))











