library(ggplot2)
library(tidyverse)
library(dplyr)

# Load data
spldata <- read.csv("~/Downloads/2022-2023-All-Checkouts-SPL-Data.csv")
colleen_hoover <- filter(spldata, Creator == "Colleen Hoover")

# Filter data for books 
book_data <- colleen_hoover%>%
  filter(Title %in% c("Verity","It Ends with Us: A Novel", "Ugly Love: A Novel"))%>%
  filter(CheckoutYear == 2022)

book_data$CheckoutMonth <- factor(book_data$CheckoutMonth)

# Create Bargraph
ggplot(book_data,aes(x= CheckoutMonth, y= Checkouts, fill= Title)) +
  geom_bar(stat = "identity", width = 0.5, position = "dodge") +
  labs(title = "Number of Checkouts per month for Top 3 Colleen Hoover books in 2022" ,
       x = "Checkout month",
       y = "Number of Checkouts") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))+
  theme(axis.text.x = element_text(size = 8, angle = 0, hjust = .5)) 
  

