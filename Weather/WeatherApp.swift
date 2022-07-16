import SwiftUI

@main
struct WeatherApp: App {
    @State var isNewView = false
    
    var body: some Scene {
        WindowGroup {
            if authData.isHavingData() {
                NavigationView {
                    WeatherGeneral()
                }
            } else {
                Authorization()
            }
        }
    }
}
