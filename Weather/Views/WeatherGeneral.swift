import SwiftUI

struct WeatherGeneral: View {
    var locationManager = LocationManager.shared
    
    @State var isNewView = false
    @State var isAlert = false
    @ObservedObject var data = DataTracking()
    
    var body: some View {
                if readingDataOfWeather(dataTracking: data) == false {
                    Text("Зайдите в настройки для определения геопозиции")
                        .font(montserratRegular)
                } else {
                    if data.weathers != nil {
                        ZStack {
                            Image("background")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 1.5)
                            Text(data.weathers!.name)
                                .font(montserratMediumLarge)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                .padding(.bottom, UIScreen.main.bounds.height / 2)
                            VStack(alignment: .center, spacing: 25) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 20) {
                                        HStack {
                                            Image(systemName: data.weathers!.image)
                                                .font(Font.system(size: 25))
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                            Text("\(data.weathers!.temperature)°")
                                                .font(montserratMediumLarge)
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                        }
                                        VStack {
                                            Image(systemName: "wind")
                                                .font(Font.system(size: 14))
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                            Text("\(String(format:"%.01f", data.weathers!.windSpeed)) м/с")
                                                .font(montserratRegular)
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                                
                                        }
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 20) {
                                        Text(data.weathers!.conditionString)
                                            .font(montserratRegular)
                                            .foregroundColor(.white)
                                            .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                        VStack {
                                            Image(systemName: "barometer")
                                                .font(Font.system(size: 14))
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                            Text("\(data.weathers!.presureMm) мм.рт.с.")
                                                .font(montserratRegular)
                                                .foregroundColor(.white)
                                                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                                        }
                                    }
                                }.padding([.leading, .trailing], 20)
                                HStack {
                                    NavigationLink(destination: WeatherDetail()
                                        .navigationTitle(data.weathers!.name)
                                        , isActive: $isNewView) {
                                    Button(action: {
                                        isNewView = true
                                    }) {
                                        HStack {
                                            VStack(alignment: .center, spacing: 12) {
                                                Text("Сейчас")
                                                    .foregroundColor(.white)
                                                    .font(montserratMedium)
                                                Image(systemName: data.weathers!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[0]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratMedium)
                                            }
                                            VStack(alignment: .center, spacing: 10) {
                                                Text(weatherGeneralMini[1]!.currentHour)
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                                Image(systemName: weatherGeneralMini[1]!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[1]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                            }
                                            VStack(alignment: .center, spacing: 10) {
                                                Text(weatherGeneralMini[2]!.currentHour)
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                                Image(systemName: weatherGeneralMini[2]!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[2]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                            }
                                            VStack(alignment: .center, spacing: 10) {
                                                Text(weatherGeneralMini[3]!.currentHour)
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                                Image(systemName: weatherGeneralMini[3]!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[3]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                            }
                                            VStack(alignment: .center, spacing: 10) {
                                                Text(weatherGeneralMini[4]!.currentHour)
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                                Image(systemName: weatherGeneralMini[4]!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[4]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                            }
                                            VStack(alignment: .center, spacing: 10) {
                                                Text(weatherGeneralMini[5]!.currentHour)
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                                Image(systemName: weatherGeneralMini[5]!.image)
                                                    .foregroundColor(.white)
                                                Text("\(String(describing: weatherGeneralMini[5]!.temperature))°")
                                                    .foregroundColor(.white)
                                                    .font(montserratRegular)
                                            }
                                        }
                                    }.padding([.top, .bottom], 10)
                                    .padding([.leading, .trailing], 20)
                                    .background(Color.gray.opacity(0.5))
                                    .cornerRadius(10)
                                    }
                                }
                            }.padding(.top, UIScreen.main.bounds.height / 3)
                        }
                    } else {
                        Text("Ошибка загрузки данных!")
                            .font(montserratRegular)
                    }
            }
        }
}

struct WeatherGeneral_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGeneral()
    }
}
