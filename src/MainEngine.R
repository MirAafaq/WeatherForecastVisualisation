# Code By Aafaq Ahmad Mir
# loading libraries 
library(httr)
library(jsonlite)

# Now Replace 'YOUR_API_KEY' with your actual API key
api_key <- "YOUR-API-KEY"
city <- "srinagar"  # Replace with your desired city
country_code <- "IN"  # Replace with the two-letter country code (e.g., "US" for United States)

# Let's Get the current date in ISO8601 format (YYYY-MM-DD)
current_date <- format(Sys.Date(), "%Y-%m-%d")

# Create the API URL for today's weather forecast
api_url <- paste0("http://api.openweathermap.org/data/2.5/forecast?q=", city, ",", country_code, "&appid=", api_key)

# Make an HTTP GET request
response <- GET(api_url)

# Parsing  the JSON response
forecast_data <- fromJSON(content(response, "text"))

# Extract today's weather data from the forecast (assuming the data is in hourly intervals)
# Find the data points for today based on the date in the forecast
today_forecast <- subset(forecast_data$list, substr(dt_txt, 1, 10) == current_date)

# Extract temperature data for today
temperature <- today_forecast$main$temp - 273.15  # Convert from Kelvin to Celsius

# Calculate mean and standard deviation for today's temperature
mean_temp <- mean(temperature)
sd_temp <- sd(temperature)

# Print the results
cat("Mean Temperature for Today:", round(mean_temp, 2), "°C\n")
cat("Standard Deviation for Today:", round(sd_temp, 2), "°C\n")

# Convert temperature data to a data frame
temperature_data <- data.frame(
  Time = as.POSIXct(today_forecast$dt_txt, format="%Y-%m-%d %H:%M:%S", tz="UTC"),
  Temperature = temperature
)

# Load ggplot2 library
library(ggplot2)

# Create a time series plot for today's temperature
ggplot(data = temperature_data, aes(x = Time, y = Temperature)) +
  geom_line(color = "blue") +
  labs(title = paste("Today's Temperature in", city),
       x = "Time",
       y = "Temperature (°C)")
