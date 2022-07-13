import SwiftUI

struct WeatherGeneral: View {
    var locationManager = LocationManager.shared
    let montserratRegular = Font.custom("Montserrat-Regular", size: 12)
    let montserratMedium = Font.custom("Montserrat-Medium", size: 12)
    @ObservedObject var data = DataTracking()
    
    var body: some View {
        Group {
            if readingDataOfWeather(dataTracking: data) == false {
                Text("Зайдите в настройки для определения геопозиции")
                    .font(montserratRegular)
            } else {
                if data.weathers != nil {
                    VStack {
                        Text("\(data.weathers!.name)")
                        HStack {
                            Text("\(data.weathers!.temperature)°")
                            Text("\(data.weathers!.condition)")
                        }
                        HStack {
                            Text("\(data.weathers!.windSpeed) м/с")
                            Text("\(data.weathers!.presureMm) мм.рт.с.")
                        }
                    }
                } else {
                    Text("Ошибка загрузки данных!")
                        .font(montserratRegular)
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
