import Foundation
import RealmSwift

let realm = try! Realm()

var userViewModel: UserViewModel = UserViewModel()

class UserViewModel {
    var users: [UserModel] = []
    
    private var model = UserModel()
    
    init() {
        read()
    }
    
    func addNewAccount(_ username: String, _ password: String) {
        model = UserModel()
        model.username = username
        model.password = password
        
        try! realm.write {
            realm.add(model)
        }
        
        read()
    }
    
    func accountVerification(_ username: String, _ password: String) -> Bool {
        for i in users {
            if i.username == username && i.password == password {
                authData.savingData(username, password)
                return true
            }
        }
        return false
    }
    
    func read() {
        users = []
        let data = realm.objects(UserModel.self)
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
        try! realm.write {
          realm.deleteAll()
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
        let data = realm.objects(UserModel.self)
        for usersFromDB in data {
            Swift.print(usersFromDB)
            if usersFromDB.username == username {
                model = usersFromDB
            }
        }
        try! realm.write {
            realm.delete(model)
        }
        model = UserModel()
        model.username = username
        model.password = newPassword
        try! realm.write {
            realm.add(model)
        }
        read()
        
        authData.savingData(username, newPassword)
        
    }
}
