import SwiftUI

struct WeatherDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .foregroundColor(.blue)
                        .font(Font.system(size: 12))
                    Text("Назад")
                        .font(montserratRegular)
                }
            }
        }
    var body: some View {
            VStack {
            List {
                ForEach(detailWeather, id: \.!.id) { gr in
                    Section(header: Text("\(gr!.day) \(gr!.months)")) {
                        ForEach(gr!.hourlyForecast) { item in
                            ListRow(item: item)
                        }
                    }
                }
            }
            }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
}

struct ListRow: View {
    var item: HourlyForecast
    var body: some View {
        HStack {
            VStack {
                Text("\(item.hour!):00")
                    .padding(.leading, 10)
                    .font(montserratMedium)
            }
            Spacer()
            VStack {
                Image(systemName: item.image)
                    .font(Font.system(size: 24))
            }
            Spacer()
            VStack {
                Text("\(String(describing: item.temp!))°")
                    .font(montserratRegular)
                Text("\(String(format:"%.01f", item.windSpeed)) м/с")
                    .font(montserratRegular)
                Text("\(item.pressureMm) мм.рт.с.")
                    .font(montserratRegular)
            }.padding(.trailing, 10)
        }
    }
}

struct WeatherDetail_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetail()
    }
}
