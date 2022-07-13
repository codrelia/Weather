import Foundation

struct DetailWeather {
    var date: String
    var hourlyForecast: [HourlyForecast]
}

struct HourlyForecast {
    let hour: String?
    let temp: Int?
    let condition: Condition
    let windSpeed: Double
    let pressureMm: Int
}
