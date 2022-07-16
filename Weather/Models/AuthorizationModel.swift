import Foundation
import Locksmith
import SwiftyVK

class AuthorizationModel {
    var username: String?
    var password: String?
    
    init() {
        let accountData = Locksmith.loadDataForUserAccount(userAccount: "WeatherApp")
        if accountData != nil && accountData!["Login"] as? String != "" {
            username = accountData!["Login"] as? String
            password = accountData!["Password"] as? String
        } else {
            updateDataLocksmith("", "")
            
            username = nil
            password = nil
        }
    }
    
    func savingData(_ newUsername: String, _ newPassword: String) {
        username = newUsername
        password = newPassword
        
        updateDataLocksmith(newUsername, newPassword)
    }
    
    func exit() {
        username = nil
        password = nil
        
        updateDataLocksmith("", "")
    }
    
    private func updateDataLocksmith(_ login: String, _ password: String) {
        do {
            try Locksmith.updateData(data: ["Login": login, "Password": password], forUserAccount: "WeatherApp")
        } catch {
            print("Error in update data in keychain")
        }
    }
    
    func isHavingData() -> Bool {
        if username != nil && password != nil {
            return true
        }
        return false
    }
}

class VKDelegateExample: SwiftyVKDelegate {
    
    let appID = "8208968"
    
    init() {
            VK.setUp(appId: appID, delegate: self)
        }

    func vkNeedsScopes(for sessionId: String) -> Scopes {
        return Scopes()
    }

    func vkNeedToPresent(viewController: VKViewController) {
        print("нужно отобразить")
    }

    func vkTokenCreated(for sessionId: String, info: [String : String]) {
        print("token created in session \(sessionId) with info \(info)")
    }

    func vkTokenUpdated(for sessionId: String, info: [String : String]) {
        print("token updated in session \(sessionId) with info \(info)")
    }

    func vkTokenRemoved(for sessionId: String) {
        print("token removed in session \(sessionId)")
    }
}
