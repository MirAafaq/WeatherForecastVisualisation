# WeatherForecastVisualisation
Get Latest Weather Updates of Any City with Visual Analystics

# Visual Representation Of Weather Forecast 
![weather_forecast](https://codejourney.in/App/Uploads/External/Images/weather_forecast.png)

# Tip 
## To Get Live Time use  Following script
```R


# Define the URL for the WorldTimeAPI
worldtime_api_url <- "http://worldtimeapi.org/api/ip"

# Make an HTTP GET request to the WorldTimeAPI
response <- GET(worldtime_api_url)

# Parse the JSON response
worldtime_data <- fromJSON(content(response, "text"))

# Extract the current date and time
current_datetime <- worldtime_data$datetime

# Print the current date and time
cat("Current Date and Time:", current_datetime, "\n")
```
# Author
[Aafaq Ahmad Mir](https://instagram.com/mir.aafaq)
