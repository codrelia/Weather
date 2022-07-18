import Foundation
import Locksmith
import SwiftyVK

class AuthorizationModel {
    var username: String?
    var password: String?
    var isVK: Bool = false
    var id: String?
    
    init() {
        let accountData = Locksmith.loadDataForUserAccount(userAccount: "WeatherApp")
        if accountData != nil && accountData!["Login"] as? String != "" {
            username = accountData!["Login"] as? String
            password = accountData!["Password"] as? String
        } else if accountData!["ID"] as? String != "" {
            username = ""
            password = ""
            isVK = true
            id = accountData!["ID"] as? String
        } else {
            updateDataLocksmith("", "", "")
            
            username = nil
            password = nil
        }
    }
    
    func savingData(_ newUsername: String, _ newPassword: String, _ isVK: Bool, _ id: String) {
        username = newUsername
        password = newPassword
        
        self.isVK = isVK
        self.id = id
        
        updateDataLocksmith(newUsername, newPassword, id)
    }
    
    func exit() {
        username = nil
        password = nil
        
        updateDataLocksmith("", "", "")
    }
    
    private func updateDataLocksmith(_ login: String, _ password: String, _ id: String) {
        do {
            try Locksmith.updateData(data: ["Login": login, "Password": password, "ID": id], forUserAccount: "WeatherApp")
        } catch {
            print("Error in update data in keychain")
        }
    }
    
    func isHavingData() -> Bool {
        if (username != nil && password != nil) || (id != nil && isVK == true) {
            return true
        }
        return false
    }
}
