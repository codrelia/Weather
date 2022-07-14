import Foundation

var weatherGeneralMini: [WeatherGeneralMini?] = []

func readingDataOfWeather(dataTracking: DataTracking) -> Bool {
    LocationManager.shared.requestLocation()
    if dataTracking.currentStatus == true {
        return true
    }
    if LocationManager.shared.userLocation != nil {
        fetchWeather(longitude: LocationManager.shared.userLocation!.coordinate.longitude, latitude: LocationManager.shared.userLocation!.coordinate.latitude, dataTracking: dataTracking)
        return true
    }
    return false
}
