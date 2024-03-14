setwd("C:\\msds511\\clean") # Set the working directory

covidcases_ts <- read.csv("confirmedcases_global_yearly.csv")

str(covidcases_ts) # show the structure of data
head(covidcases_ts) # Show the head of data frame
tail(covidcases_ts) # Show the tail of data frame
summary(covidcases_ts) # Show the exploratory of data

#creating time series
covidcases_ts <- ts(covidcases_ts$Total_Cases, start=2020, end=2023, frequency = 12)

# Show frequency time series.
print(covidcases_ts)

# Plot time series
plot(covidcases_ts, col="orange", type="o", main = "Covid-19 Confirmed Cases from 2020 to 2023",
     xlab = "Year", 
     ylab = "Total Cases")

print("*************End of plot*****************")

###############################################################################

# Loading library
library(ggplot2)

setwd("C:\\msds511\\clean") # Set the working directory

# Import the COVID-19 time series dataset into R
covidcases_ts <- read.csv("confirmedcases_global_yearly.csv")

head(covidcases_ts) # Show the head of data frame
tail(covidcases_ts) # Show the tail of data frame
str(covidcases_ts) # Show the structure of data
summary(covidcases_ts) # Show the exploratory of data

missing_value <- sum(is.na(covidcases_ts))# Check for missing values
covidcases_ts <- na.omit(covidcases_ts) # Clean missing values

covidcases_ts$Date <- as.Date(covidcases_ts$Date, format = "%m/%d/%Y") # Format Date

# Create a time series plot using ggplot2
ggplot(covidcases_ts, aes(Date, Total_Cases)) + 
  geom_path(linewidth=.8)+
  scale_y_continuous(name="Number of Cases", labels = scales::comma)+
  labs(title = "Covid-19 Confirmed Cases from 2020 to 2023", x = "Year", y = "") +
  theme_linedraw()

print("*************End of ggplot*****************")

###############################################################################

setwd("C:\\msds511\\clean") # Set the working directory

coviddeath_ts <- read.csv("deaths_global_yearly.csv")

str(coviddeath_ts) # show the structure of data
head(coviddeath_ts) # Show the head of data frame
tail(coviddeath_ts) # Show the tail of data frame

summary(coviddeath_ts) # Show the exploratory of data

#creating time series
coviddeath_ts <- ts(coviddeath_ts$Total_Deaths, start=2020, end=2023, frequency = 4)

# Show frequency time series.
print(coviddeath_ts)

# Plot time series
plot(coviddeath_ts, col="purple", type="o", main = "Covid-19 Deaths from 2020 to 2023",
     xlab = "Year", 
     ylab = "Total Deaths")


###############################################################################
setwd("C:\\msds511\\clean") # Set the working directory

covidrecovey_ts <- read.csv("recovered_global_yearly.csv")

str(covidrecovey_ts) # show the structure of data
head(covidrecovey_ts) # Show the head of data frame
tail(covidrecovey_ts) # Show the tail of data frame

summary(covidrecovey_ts) # Show the exploratory of data

#creating time series
covidrecovey_ts <- ts(covidrecovey_ts$Total_Recovered, start=2020, end=2023, frequency = 12)

# Show frequency time series.
print(covidrecovey_ts)

# Plot time series
plot(covidrecovey_ts, col="blue", type="o", main = "Covid-19 Recoveries from 2020 to 2023",
     xlab = "Year", 
     ylab = "Total Recovered")

###############################################################################

setwd("C:/msds511/clean") # Set the working directory

library(ggplot2)

province_cases <- read.csv("confirmedcases_global_province.csv")
str(province_cases) # show the structure of data
head(province_cases) # Show the head of data frame
tail(province_cases) # Show the tail of data frame

summary(province_cases) # Show the exploratory of data

# Plot the distribution
cases <- ggplot(province_cases, aes(x = reorder(Province, -Total_Cases), y = Total_Cases))
cases <- cases + geom_bar(stat="identity", color='skyblue',fill='steelblue')
cases <- cases + theme(axis.text.x=element_text(angle=90, hjust=1))

# Scale the y-axis values
cases <- cases + scale_y_continuous(labels = scales::comma)

#Show barplot distribution
print(cases)

###############################################################################

setwd("C:/msds511/clean") # Set the working directory

library(ggplot2)

province_death <- read.csv("deaths_global_province.csv")
str(province_death) # show the structure of data
head(province_death) # Show the head of data frame
tail(province_death) # Show the tail of data frame

summary(province_death) # Show the exploratory of data

#Using subsetting to exclude NA values
check_missing_num <- province_death[complete.cases(province_death$Total.Deaths), ]

# Plot the distribution
death <- ggplot(province_death, aes(x = reorder(Province.State, -Total.Deaths), y = Total.Deaths))
death <- death + geom_bar(stat="identity", color='skyblue',fill='steelblue')
death <- death + theme(axis.text.x=element_text(angle=90, hjust=1))

# Scale the y-axis values
death <- death + scale_y_continuous(labels = scales::comma)

#Show barplot distribution
print(death)

###############################################################################

setwd("C:/msds511/clean") # Set the working directory

library(ggplot2)

province_recovery <- read.csv("recovered_global_country.csv")
str(province_recovery) # show the structure of data
head(province_recovery) # Show the head of data frame
tail(province_recovery) # Show the tail of data frame

summary(province_recovery) # Show the exploratory of data

#Using subsetting to exclude NA values
check_missing_num <- province_recovery[complete.cases(province_recovery$Total.Recovered), ]

# Plot the distribution by ggplot
recovered <- ggplot(province_recovery, aes(x = reorder(Country.Region , -Total.Recovered), y = Total.Recovered))
recovered <- recovered + geom_bar(stat="identity", color='skyblue',fill='steelblue')
recovered <- recovered + theme(axis.text.x=element_text(angle=90, hjust=1))

# Scale the y-axis values
recovered <- recovered + scale_y_continuous(labels = scales::comma)

#Show barplot distribution
print(recovered)

###############################################################################

# Load required libraries
library(ggplot2)
library(dplyr)

# Set the working directory
setwd("C:\\msds511") 

# Read the CSV dataset
covid_data <- read.csv("cases_deaths_recoveries_population.csv")
str(covid_data)

# Convert date column to Date format
covid_data$date <- as.Date(covid_data$date, format = "%m/%d/%Y")

# Plot daily new cases
gplotcases <- ggplot(covid_data, aes(x = date, y = total_cases)) +
  geom_line(color = "blue") +
  scale_y_continuous(name="Number of New Cases", labels = scales::comma)+
  labs(title = "Daily New Cases of Covid-19", x = "Daily", y = "New Cases") +
  theme_minimal()
#theme(axis.text.x = element_text(angle = 45, vjust = 1))

#Show plot visualization
print(gplotcases)

# Plot daily Deaths
gplotdeaths <- ggplot(covid_data, aes(x = date, y = total_deaths)) +
  geom_line(color = "orange") +
  scale_y_continuous(name="Number of new Deaths", labels = scales::comma)+
  labs(title = "Daily New Deaths of Covid-19", x = "Daily", y = "New Deaths") +
  theme_minimal()

#Show plot visualization
print(gplotdeaths)

gplotrecovery <- ggplot(covid_data, aes(x=date, total_recoveries, length.out = 1000)) + 
  geom_line(color = "purple")+
  scale_y_continuous(name="Number of Recoveries", labels = scales::comma)+
  labs(title = "Daily New Recoveries of Covid-19", x = "Daily", y = "") +
  theme_minimal()

#Show plot visualization
print(gplotrecovery)

print("*************End of ggplot*****************")

###############################################################################
# Load necessary packages
library(tidyverse)
library(lubridate)
library(ggplot2)

setwd("C:\\msds511\\clean") # Set the working directory
data_c <- read.csv("cases_deaths_recoveries.csv") # Read CSV dataset
str(data_c)
summary(data_c)

# Changes and Growth
data_c <- data_c %>%
  filter(Country.Region %in% c("Australia", "Canada", "China")) %>%
  mutate(date = as.Date(date, format = "%m/%d/%y")) %>%
  group_by(Country.Region) %>%
  mutate(daily_changes_c = c(total_cases[1], diff(total_cases)),
         daily_growth_c = daily_changes_c / lag(total_cases, n = 1, default = first(total_cases)))

# Print selected cleaned data
head(data_c)

plot(data_c$daily_changes_c, main = "Daily Changes Cases", 
     xlab = "X-Changes", ylab = "Total Cases")

###############################################################################
# Load necessary packages
library(tidyverse)
library(lubridate)
library(ggplot2)

setwd("C:\\msds511\\clean") # Set the working directory
data_c <- read.csv("cases_deaths_recoveries.csv") # Read CSV dataset
str(data_c)
summary(data_c)

# Changes and Growth
data_c <- data_c %>%
  filter(Country.Region %in% c("Australia", "Canada", "China")) %>%
  mutate(date = as.Date(date, format = "%m/%d/%y")) %>%
  group_by(Country.Region) %>%
  mutate(daily_changes_c = c(total_cases[1], diff(total_cases)),
         daily_growth_c = daily_changes_c / lag(total_cases, n = 1, default = first(total_cases)))

# Print selected cleaned data
head(data_c)

plot(data_c$daily_changes_c, main = "Daily Changes Cases", 
     xlab = "X-Changes", ylab = "Total Cases")

###################################################################
# Load necessary packages
library(tidyverse)
library(lubridate)

setwd("C:\\msds511\\clean") # Set the working directory
data_d <- read.csv("cases_deaths_recoveries.csv") # Read CSV dataset
str(data_d)
summary(data_d)

# Deaths
data_d <- data_d %>%
  filter(Country.Region %in% c("Australia", "Canada", "China")) %>%
  mutate(date = as.Date(date, format = "%m/%d/%y")) %>%
  group_by(Country.Region) %>%
  mutate(daily_changes_d = c(total_deaths[1], diff(total_deaths)),
         daily_growth_d = daily_changes_d / lag(total_deaths, n = 1, default = first(total_deaths)))

# Print selected cleaned data
head(data_d)

plot(data_d$daily_changes_d, main = "Daily Deaths Cases", 
     xlab = "X-Changes", ylab = "Daily Deaths")

###############################################################################
# Load necessary packages
library(tidyverse)
library(lubridate)

setwd("C:\\msds511\\clean") # Set the working directory
data_r <- read.csv("cases_deaths_recoveries.csv") # Read CSV dataset
str(data_r)
summary(data_r)

#Recoveries
data_r <- data_r %>%
  filter(Country.Region %in% c("Australia", "Canada", "China")) %>%
  mutate(date = as.Date(date, format = "%m/%d/%y")) %>%
  group_by(Country.Region) %>%
  mutate(daily_changes_r = c(total_recoveries[1], diff(total_recoveries)),
         daily_growth_r = daily_changes_r / lag(total_recoveries, n = 1, default = first(total_recoveries)))

# Print selected cleaned data
head(data_r)

plot(data_r$daily_changes_r, main = "Daily Recoveries Cases", 
     xlab = "X-Changes", ylab = "Daily Recoveries")

###############################################################################

# Load necessary packages
library(tidyverse)
library(lubridate)
library(ggplot2)
library(forecast)

setwd("C:\\msds511\\clean") # Set the working directory
data <- read.csv("confirmedcases_global_country.csv")
str(data)

# Clean and preprocess the data
data <- data %>%
  filter(Country.Region %in% c("Australia", "Canada", "China")) %>%
  group_by(Country.Region) %>%
  mutate(daily_changes = c(ConfirmedCases[1], diff(ConfirmedCases)))

# Create a time series object for each country
ts_data <- ts(data$daily_changes, frequency = 1)

# Fit a moving average model for each country
ma_model <- lapply(ts_data, ma, order = 1)

# Forecast the model and plot the results for each country
forecast_list <- lapply(ma_model, forecast)
forecast_plots <- lapply(forecast_list, autoplot)

# Plot the forecast results for each country
for (i in 1:length(forecast_plots)) {
  print(forecast_plots[[i]])
}

###############################################################################

# Load necessary packages
library(tidyverse)
library(ggplot2)
library(corrplot)

setwd("C:\\msds511\\clean") # Set the working directory

# Read COVID-19 data
covid_data <- read.csv("cases_deaths_recoveries.csv")
str(covid_data) # Display data structure
summary(covid_data) # Data exploratory

globe_data <- read.csv("global_population.csv")
str(globe_data) # Display data structure
summary(globe_data) # Data exploratory

# Merge data based on commonality
merged_data <- merge(covid_data, globe_data, by = "Country.Region", all = TRUE)

# Check for missing values
merged_data <- na.omit(merged_data) 

# Calculate correlations between variables
correlation_matrix <- cor(merged_data[c("total_cases", "total_deaths", "total_recoveries", "population")])

# Visualize correlation matrix
corrplot::corrplot(correlation_matrix, method = "color")

# Scatter plot to visualize relationships
ggplot(merged_data, aes(x = total_cases, y = population)) +
  geom_point(size=2, color="maroon") +
  scale_y_continuous(name = "Population", labels = scales::comma) +
  scale_x_continuous(name = "Confirmed Cases", labels = scales::comma) +
  labs(title = "Relationship between Confirmed Cases and Population", x = "Population", y = "") +
  theme_classic()

ggplot(merged_data, aes(x = total_deaths, y = population)) +
  geom_point(size=2, color="purple") +
  scale_y_continuous(name = "Population", labels = scales::comma) +
  scale_x_continuous(name = "Deaths", labels = scales::comma) +
  labs(title = "Relationship between Deaths and Population", x = "Number of Recoveries", y = "") +
  theme_classic()

ggplot(merged_data, aes(x = total_recoveries, y = population)) +
  geom_point(size=2, color="orange") +
  scale_y_continuous(name = "Population", labels = scales::comma) +
  scale_x_continuous(name = "Recoveries", labels = scales::comma) +
  labs(title = "Relationship between Recoveries and Population", x = "Number of Recoveries", y = "") +
  theme_classic()

##############################################################################
