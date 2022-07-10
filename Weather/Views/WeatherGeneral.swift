import SwiftUI

struct WeatherGeneral: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                Button(action: {
                    LocationManager.shared.requestLocation()
                }) {
                    Text("Изменить геопозицию")
                }
            } else if let location = locationManager.userLocation {
                Text("\(location)")
            }
        }
    }
}

struct WeatherGeneral_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGeneral()
    }
}
