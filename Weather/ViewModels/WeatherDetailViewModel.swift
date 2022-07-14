import Foundation

var detailWeather: [DetailWeather?] = []

func insertDetailWeather(weather: Weather, currentHour: Int) {
    var newValue = DetailWeather(date: weather.forecasts[0].date, hourlyForecast: [])
    for j in currentHour..<weather.forecasts[0].hours.count {
        newValue.hourlyForecast.append(HourlyForecast(hour: weather.forecasts[0].hours[j].hour, temp: weather.forecasts[0].hours[j].temp, condition: weather.forecasts[0].hours[j].condition, windSpeed: weather.forecasts[0].hours[j].windSpeed, pressureMm: weather.forecasts[0].hours[j].pressureMm))
    }
    detailWeather.append(newValue)
    
    var minCount: Int = 0
    if weather.forecasts.count >= 5 {
        minCount = 5
    } else {
        minCount = weather.forecasts.count
    }
    
    for i in 1..<minCount {
        newValue = DetailWeather(date: weather.forecasts[i].date, hourlyForecast: [])
        for j in 0..<weather.forecasts[i].hours.count {
            newValue.hourlyForecast.append(HourlyForecast(hour: weather.forecasts[i].hours[j].hour, temp: weather.forecasts[i].hours[j].temp, condition: weather.forecasts[i].hours[j].condition, windSpeed: weather.forecasts[i].hours[j].windSpeed, pressureMm: weather.forecasts[i].hours[j].pressureMm))
        }
        if newValue.hourlyForecast.count != 0 {
            detailWeather.append(newValue)
        }
    }
}
