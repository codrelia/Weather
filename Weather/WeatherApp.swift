import SwiftUI
import UIKit
import SwiftyVK

var vkDelegateReference : SwiftyVKDelegate?

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        vkDelegateReference = VKDelegate()
        return true
    }
    
    @available(iOS 9.0, *)
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
        ) -> Bool {
        let app = options[.sourceApplication] as? String
        VK.handle(url: url, sourceApplication: app)
        return true
    }
    
    func application(
        _ application: UIApplication,
        open url: URL,
        sourceApplication: String?,
        annotation: Any
        ) -> Bool {
        VK.handle(url: url, sourceApplication: sourceApplication)
        return true
    }
}

@main
struct WeatherApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var isNewView = false
    
    var body: some Scene {
        WindowGroup {
            if authData.isHavingData() {
                NavigationView {
                    WeatherGeneral()
                }
            } else {
                NavigationView {
                    Authorization()
                }
            }
        }
    }
}


@available(iOS 9.0, *)
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
    let app = options[.sourceApplication] as? String
    VK.handle(url: url, sourceApplication: app)
    return true
}

func application(
    _ application: UIApplication,
    open url: URL,
    sourceApplication: String?,
    annotation: Any
    ) -> Bool {
    VK.handle(url: url, sourceApplication: sourceApplication)
    return true
}
