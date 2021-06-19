# a script to scrape data for nba salaries in 20-21 season

# installing necessary packages
install.packages('tidyverse')
install.packages('data.table')

library(rvest)
library(stringr)
library(magrittr)
library(data.table)
library(tidyverse)

# Get salary dataset 
webpage <- read_html("https://www.basketball-reference.com/contracts/players.html")
salary.table <- webpage %>% html_table(header = FALSE) %>% extract2(1)

# creating a names column
names(salary.table) <- salary.table[2,]

# only including data from the 20-21 season and removing the first column
salary.table <- salary.table[-1, 2:4]
names(salary.table)[3] <- "nba_season_20_21"

# filtering out unnecessary rows 
salary.table <- salary.table %>% 
  filter(Player != "" & Player != "Player")

# removing ',' signs from salary columns
salary.table$nba_season_20_21 <- 
  gsub(",", "", salary.table$nba_season_20_21)

# removing '$' signs from salary columns and conerting to numeric 
salary.table$nba_season_20_21 <- 
  gsub('\\$', '', salary.table$nba_season_20_21)
salary.table$nba_season_20_21 <- as.numeric(salary.table$nba_season_20_21)

# create a .csv file for 20-21 contract salary data
write.csv(salary.table, "NBA_season_20_21_salary.csv")

NBA_season_20_21_salary <- read_csv("NBA_season_20_21_salary.csv")
view(NBA_season_20_21_salary)
