import Foundation

struct Weather: Decodable {
    let now_dt: String
    let info: Info
    let geo_object: GeoObject
    let fact: Fact
    let forecasts: [Forecast]
}

struct Info: Decodable {
    let tzinfo: Tzinfo
}

struct Tzinfo: Decodable {
    let offset: Int
    let name: String
}

struct GeoObject: Decodable {
    let locality: Country
}

struct Country: Decodable {
    let id: Int
    let name: String
}

struct Fact: Decodable {
    let temp: Int
    let condition: Condition
    let windSpeed: Double
    let pressureMm: Int
    let daytime: Daytime
    
    enum CodingKeys: String, CodingKey {
            case temp
            case condition
            case windSpeed = "wind_speed"
            case pressureMm = "pressure_mm"
            case daytime
        }
}

struct Forecast: Decodable {
    let date: String
    let hours: [Hour]
    
    enum CodingKeys: String, CodingKey {
            case date
            case hours
        }
}

struct Hour: Decodable {
    let hour: String?
    let temp: Int?
    let condition: Condition
    let windSpeed: Double
    let pressureMm: Int
    
    enum CodingKeys: String, CodingKey {
            case hour
            case temp
            case condition
            case windSpeed = "wind_speed"
            case pressureMm = "pressure_mm"
        }
}

enum Condition: String, Codable {
    case clear = "clear"
    case partlyCloudy = "partly-cloudy"
    case cloudy = "cloudy"
    case overcast = "overcast"
    case drizzle = "drizzle"
    case lightRain = "light-rain"
    case rain = "rain"
    case moderateRain = "moderate-rain"
    case heavyRain = "heavy-rain"
    case continuousHeavyRain = "continuous-heavy-rain"
    case showers = "showers"
    case wetSnow = "wet-snow"
    case lightSnow = "light-snow"
    case snow = "snow"
    case snowShowers = "snow-showers"
    case hail = "hail"
    case thunderstorm = "thunderstorm"
    case thunderstormWithRain = "thunderstorm-with-rain"
    case thunderstormWithHail = "thunderstorm-with-hail"
}

enum Daytime: String, Codable {
    case d = "d"
    case n = "n"
}

func fetchWeather(longitude: Double, latitude: Double, dataTracking: DataTracking) {
    let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(String(describing: latitude))&lon=\(String(describing: longitude))&extra=true"
    guard let url = URL(string: urlString) else { return }
    
    var request = URLRequest(url: url, timeoutInterval: .infinity)
    request.addValue("850e9768-50b1-44d3-bd85-bae1a9d6739f", forHTTPHeaderField: "X-Yandex-API-Key")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else {
            print(String(describing: error))
            return
        }
        if let weather = parseJSON(withData: data) {
            dataTracking.updateValue(newWeathers: weather)
        }
    }
    task.resume()
}

func parseJSON(withData data: Data) -> WeatherGeneralViewModel? {
    do {
        let weatherData = try JSONDecoder().decode(Weather.self, from: data)
        let weather = WeatherGeneralViewModel(weather: weatherData)
        return weather
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    return nil
}
