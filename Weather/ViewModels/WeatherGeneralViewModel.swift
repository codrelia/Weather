import Foundation

class DataTracking: ObservableObject {
    @Published var weathers: WeatherGeneralViewModel? = nil
    
    func updateValue(newWeathers: WeatherGeneralViewModel?) {
        weathers = newWeathers
    }
}

struct WeatherGeneralViewModel {
    var currentHour: Int
    var name: String
    
    var temperature: Int
    var condition: String
    var presureMm: Int
    var windSpeed: Double
    
    var detailedWeather: [WeatherGeneralMiniVersion] = []
    
    var conditionString: String {
        switch condition {
        case "clear": return "Ясно"
        case "partly-cloudy": return "Малооблачно"
        case "cloudy": return "Облачно с прояснениями"
        case "overcast": return "Пасмурно"
        case "drizzle": return "Морось"
        case "light-rain": return "Небольшой дождь"
        case "rain": return "Дождь"
        case "moderate-rain": return "Умеренно сильный дождь"
        case "heavy-rain": return "Сильный дождь"
        case "continuous-heavy-rain": return "Длительный сильный дождь"
        case "showers": return "Ливень"
        case "wet-snow": return "Дождь со снегом"
        case "light-snow": return "Небольшой снег"
        case "snow": return "Снег"
        case "snow-showers": return "Снегопад"
        case "hail": return "Град"
        case "thunderstorm": return "Гроза"
        case "thunderstorm-with-rain": return "Дождь с грозой"
        case "thunderstorm-with-hail": return "Гроза с градом"
        default:
            return "Неопределено"
        }
    }
    
    init(weather: Weather) {
        temperature = weather.fact.temp
        condition = weather.fact.condition.rawValue
        presureMm = weather.fact.pressureMm
        windSpeed = weather.fact.windSpeed
        
        let indexOfTime = weather.now_dt.firstIndex(of: "T")!
        let indexOfColon = weather.now_dt.firstIndex(of: ":")!
        var substring = weather.now_dt[indexOfTime...indexOfColon]
        substring.removeFirst()
        substring.removeLast()
        
        name = weather.geo_object.locality.name
        currentHour = Int(substring)! + weather.info.tzinfo.offset / 3600
        detailedWeather.append(WeatherGeneralMiniVersion(hour: 1, temperature: 15, condition: "cloudy"))
    }
}

struct WeatherGeneralMiniVersion {
    var hour: Int
    var temperature: Int
    var condition: String
    
    init(hour: Int, temperature: Int, condition: String) {
        self.hour = hour
        self.temperature = temperature
        self.condition = condition
    }
}

func readingDataOfWeather(dataTracking: DataTracking) -> Bool {
    LocationManager.shared.requestLocation()
    if LocationManager.shared.userLocation != nil {
        fetchWeather(longitude: LocationManager.shared.userLocation!.coordinate.longitude, latitude: LocationManager.shared.userLocation!.coordinate.latitude, dataTracking: dataTracking)
        return true
    }
    return false
}
