import Foundation

struct DetailWeather: Identifiable {
    var date: String
    var hourlyForecast: [HourlyForecast]
    let id = UUID()
    
    var day: String {
        return date.components(separatedBy: "-")[2]
    }
    
    var months: String {
        switch date.components(separatedBy: "-")[1] {
        case "01": return "января"
        case "02": return "февраля"
        case "03": return "марта"
        case "04": return "апреля"
        case "05": return "мая"
        case "06": return "июня"
        case "07": return "июля"
        case "08": return "августа"
        case "09": return "сентября"
        case "10": return "октября"
        case "11": return "ноября"
        case "12": return "декабря"
        default:
            return "ОШИБКА"
        }
    }
}

struct HourlyForecast: Hashable, Identifiable {
    let hour: String?
    let temp: Int?
    let condition: Condition
    let windSpeed: Double
    let pressureMm: Int
    let id = UUID()
    
    var image: String {
        switch condition.rawValue {
        case "clear": return "sun.max"
        case "partly-cloudy": return "cloud.sun.fill"
        case "cloudy": return "cloud.sun.fill"
        case "overcast": return "cloud.fill"
        case "drizzle": return "cloud.drizzle.fill"
        case "light-rain": return "cloud.rain.fill"
        case "rain": return "cloud.rain.fill"
        case "moderate-rain": return "cloud.rain.fill"
        case "heavy-rain": return "cloud.heavyrain.fill"
        case "continuous-heavy-rain": return "cloud.heavyrain.fill"
        case "showers": return "cloud.heavyrain.fill"
        case "wet-snow": return "cloud.sleet.fill"
        case "light-snow": return "cloud.snow.fill"
        case "snow": return "cloud.snow.fill"
        case "snow-showers": return "cloud.snow.fill"
        case "hail": return "cloud.hail.fill"
        case "thunderstorm": return "cloud.bolt.fill"
        case "thunderstorm-with-rain": return "cloud.bolt.rain.fill"
        case "thunderstorm-with-hail": return "cloud.bolt.rain.fill"
        default:
            return "unknow"
        }
    }
}
