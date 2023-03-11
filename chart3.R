library(ggplot2)
library(tidyverse)
library(dplyr)

# Load data
spldata <- read.csv("~/Downloads/2022-2023-All-Checkouts-SPL-Data.csv")
colleen_hoover <- filter(spldata, Creator == "Colleen Hoover")

# Filter Data
all_checkouts <- colleen_hoover%>%
  filter(Creator != "") %>%
  filter(CheckoutYear == 2022)%>%
  group_by(CheckoutMonth)%>%
  summarize(Checkouts = sum(Checkouts))


all_checkouts$CheckoutMonth <- factor(all_checkouts$CheckoutMonth)

# Create Line plot
ggplot(all_checkouts, aes(x = CheckoutMonth, y = Checkouts, fill = Checkouts)) +
  geom_bar(stat = "identity", width = 0.9, position = "dodge") + 
  labs(title = "Total Checkouts per month in 2022",
       x = "Month",
       y = "Checkouts",
       fill = "Total Checkouts") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))+
  theme(axis.text.x = element_text(size = 8, angle = 0, hjust = .5))

