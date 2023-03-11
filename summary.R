library(dplyr)
library(tidyverse)

# Load data
spldata <- read.csv("~/Downloads/2022-2023-All-Checkouts-SPL-Data.csv")
colleen_hoover <- filter(spldata, Creator == "Colleen Hoover")
title <- colleen_hoover$Title
checkouts <- colleen_hoover$Checkouts

# How many total checkouts occured?

total_checkouts <- sum(colleen_hoover$Checkouts)

# Which book has the most amount of checkouts?

max_checkouts_title <- colleen_hoover%>%
  filter(checkouts == max(checkouts))%>%
  filter(Title == max(Title, na.rm = TRUE))%>%
  pull(Title)

# How many total checkouts did this book have?

verity_checkouts <- sum(subset(colleen_hoover, Title == "Verity")$Checkouts)

 # What month did this book have the most amount of checkouts

  verity_max_checkoutmonth <- colleen_hoover%>%
  filter(checkouts == max(checkouts))%>%
  filter(Checkouts == sum(Checkouts, na.rm = TRUE))%>%
  pull(CheckoutMonth)

# What book had the least amount of checkouts?

min_checkouts_title <- colleen_hoover%>%
  filter(checkouts == min(checkouts))%>%
  filter(Title == min(Title, na.rm = TRUE))%>%
  pull(Title)

# How many checkouts did the least checked out book have?

least_checkout_number <- sum(subset(colleen_hoover, Title == "All das Ungesagte zwischen uns")$Checkouts)



