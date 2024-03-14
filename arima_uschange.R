# ARIMA using uschange data frame
# Load required library
library(seasonal)
library(fpp2)
library(fpp)

#View(uschange)

dim(uschange) # display the dimension of data frame
str(uschange) # show the structure of data frame
summary(uschange) # display the summary of data

# US time series data
autoplot(uschange[,"Consumption"]) +
  xlab("Year") + 
  ylab("Quarterly Percentage Change")

# Using ARIMA fit model
fit <- auto.arima(uschange[,"Consumption"], seasonal = FALSE)
fit

#ARIMA forecast
fit %>% forecast(h=10) %>% autoplot(include=80)

#ACF Plot
Acf(uschange[,"Consumption"])

#PACF plot
pacf(uschange[,"Consumption"])

##############################################################

# US time series data
autoplot(uschange[,"Income"]) +
  xlab("Year") + 
  ylab("Quarterly Percentage Change")

# Using ARIMA fit model
fit <- auto.arima(uschange[,"Income"], seasonal = FALSE)
fit

#ARIMA forecast
fit %>% forecast(h=10) %>% autoplot(include=70)

#ACF Plot
Acf(uschange[,"Income"])

#PACF plot
pacf(uschange[,"Income"])

############################################################

# US time series data
autoplot(uschange[,"Savings"]) +
  xlab("Year") + 
  ylab("Quarterly Percentage Change")

# Using ARIMA fit model
fit <- auto.arima(uschange[,"Savings"], seasonal = FALSE)
fit

#ARIMA forecast
fit %>% forecast(h=10) %>% autoplot(include=75) # With 75% prediction values

#ACF Plot
Acf(uschange[,"Savings"])

#PACF plot
pacf(uschange[,"Savings"])

############################################################

# US time series data
autoplot(uschange[,"Production"]) +
  xlab("Year") + 
  ylab("Quarterly Percentage Change")

# Using ARIMA fit model
fit <- auto.arima(uschange[,"Production"], seasonal = FALSE)
fit

#ARIMA forecast
fit %>% forecast(h=10) %>% autoplot(include=90) # With 80% prediction values

#ACF Plot
Acf(uschange[,"Production"])

#PACF plot
pacf(uschange[,"Production"])

############################################################

# US time series data
autoplot(uschange[,"Unemployment"]) +
  xlab("Year") + 
  ylab("Quarterly Percentage Change")

# Using ARIMA fit model
fit <- auto.arima(uschange[,"Unemployment"], seasonal = FALSE)
fit

#ARIMA forecast
fit %>% forecast(h=10) %>% autoplot(include=85) # With 85% prediction values

#ACF Plot
Acf(uschange[,"Unemployment"])

#PACF plot
pacf(uschange[,"Unemployment"])

