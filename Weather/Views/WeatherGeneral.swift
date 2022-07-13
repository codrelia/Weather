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
                    VStack(alignment: .center, spacing: 25) {
                        Text(data.weathers!.name)
                            .font(Font.system(size: 25))
                            .multilineTextAlignment(.leading)
                        HStack(alignment: .center, spacing: UIScreen.main.bounds.width / 4) {
                            HStack {
                                Image(systemName: "sun.max")
                                    .font(Font.system(size: 45))
                                Text("\(data.weathers!.temperature)°")
                                    .font(Font.system(size: 45))
                            }
                            Text(data.weathers!.conditionString)
                        }
                        HStack(alignment: .center, spacing: UIScreen.main.bounds.width / 1.97 ) {
                            VStack {
                                Image(systemName: "wind")
                                Text("\(data.weathers!.windSpeed) м/с")
                            }
                            VStack {
                                Image(systemName: "barometer")
                                Text("\(data.weathers!.presureMm) мм.рт.с.")
                            }
                        }
                        HStack {
                            Button(action: {
                                print("кнопка")
                            }) {
                                Text("Разработка")
                            }.padding([.top, .bottom], 35)
                                .padding([.leading, .trailing], 135)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }.padding(.top, UIScreen.main.bounds.height / 4)
                } else {
                    Text("Ошибка загрузки данных!")
                        .font(montserratRegular)
                }
            }
        }.onReceive(data.$weathers, perform: { w in
            
        })
    }
}

struct WeatherGeneral_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGeneral()
    }
}
