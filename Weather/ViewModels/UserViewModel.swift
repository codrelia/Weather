import Foundation
import RealmSwift
import SwiftyVK

let realmDatabase = try! Realm()

var userViewModel: UserViewModel = UserViewModel()

class UserViewModel {
    var users: [UserModel] = []
    
    private var model = UserModel()
    
    init() {
        read()
    }
    
    func addNewAccount(_ username: String, _ password: String, _ isVK: Bool) {
        model = UserModel()
        model.username = username
        model.password = password
        model.isVK = isVK
        
        if isVK {
            model.id = VK.sessions.default.id
        }
        
        try! realmDatabase.write {
            realmDatabase.add(model)
        }
        
        authData.savingData(username, password, false, "")
        
        read()
    }
    
    func accountVerification(_ username: String, _ password: String, _ isVK: Bool, _ id: String) -> Bool {
        for i in users {
            if i.username == username && i.password == password && i.isVK == isVK && i.id == id {
                authData.savingData(username, password, isVK, id)
                return true
            }
        }
        return false
    }
    
    func read() {
        users = []
        let data = realmDatabase.objects(UserModel.self)
        for usersFromDB in data {
            users.append(usersFromDB)
        }
    }
    
    func print() {
        for i in users {
            Swift.print(i)
        }
    }
    
    func deleteAll() {
        authData.exit()
        try! realmDatabase.write {
          realmDatabase.deleteAll()
        }
    }
    
    func isIdenticalNames(_ newUsername: String) -> Bool {
        for i in users {
            if i.username == newUsername {
                return true
            }
        }
        return false
    }
    
    func changeThePassword(_ username: String, _ newPassword: String) {
        let data = realmDatabase.objects(UserModel.self)
        for usersFromDB in data {
            Swift.print(usersFromDB)
            if usersFromDB.username == username {
                model = usersFromDB
            }
        }
        try! realmDatabase.write {
            realmDatabase.delete(model)
        }
        model = UserModel()
        model.username = username
        model.password = newPassword
        try! realmDatabase.write {
            realmDatabase.add(model)
        }
        read()
        
        authData.savingData(username, newPassword, false, "")
        
    }
}
