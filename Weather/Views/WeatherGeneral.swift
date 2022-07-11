import SwiftUI

struct WeatherGeneral: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    let montserratRegular = Font.custom("Montserrat-Regular", size: 12)
    let montserratMedium = Font.custom("Montserrat-Medium", size: 12)
    
    init() {
        LocationManager.shared.requestLocation()
        if locationManager.userLocation != nil {
            fetchWeather(longitude: locationManager.userLocation!.coordinate.longitude, latitude: locationManager.userLocation!.coordinate.latitude)
        }
    }
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                Text("Зайдите в настройки для определения геопозиции")
                    .font(montserratRegular)
            } else {
                VStack {
                    Text("\(weathers!.name)")
                    HStack {
                        Text("\(weathers!.temperature)°")
                        Text("\(weathers!.condition)")
                    }
                    HStack {
                        Text("\(weathers!.windSpeed) м/с")
                        Text ("\(weathers!.presureMm) мм.рт.с.")
                    }
                }
                
            }
        }
    }
}

struct WeatherGeneral_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGeneral()
    }
}
