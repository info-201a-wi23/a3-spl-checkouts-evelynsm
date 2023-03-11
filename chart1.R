library(ggplot2)
library(tidyverse)
library(dplyr)

# Load Data
spldata <- read.csv("~/Downloads/2022-2023-All-Checkouts-SPL-Data.csv")
colleen_hoover <- filter(spldata, Creator == "Colleen Hoover")

#Filter Data
month_data <- colleen_hoover%>%
  filter(CheckoutYear == 2022)%>%
  filter(Title %in% c("Verity", "It Ends with Us: A Novel", "Ugly Love: A Novel"))%>%
  group_by(Title) %>%
  summarize(Checkouts = sum(Checkouts))

#Create Line plot
ggplot(month_data,aes(x= Title, y= Checkouts, fill= Title)) +
  geom_bar(stat = "identity", width = 0.7, position = position_dodge(width = 1)) +
  labs(title = "Total Number of Checkouts in 2022 for Top 3 Colleen Hoover Books" ,
       x = "Book Title",
       y = "Number of Checkouts") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))+
  theme(axis.text.x = element_text(size = 8, angle = 8, hjust = .5))


