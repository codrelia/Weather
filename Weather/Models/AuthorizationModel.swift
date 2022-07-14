import Foundation

class AuthorizationModel {
    var username: String?
    var password: String?
    
    init() {
        username = defaults.string(forKey: "Username")
        password = defaults.string(forKey: "Password")
    }
    
    func savingData(_ newUsername: String, _ newPassword: String) {
        username = newUsername
        password = newPassword
        
        defaults.set(newUsername, forKey: "Username")
        defaults.set(newPassword, forKey: "Password")
    }
    
    func exit() {
        username = nil
        password = nil
        
        defaults.set(nil, forKey: "Username")
        defaults.set(nil, forKey: "Password")
    }
}

