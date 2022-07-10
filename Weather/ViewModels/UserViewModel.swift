import Foundation
import RealmSwift

let realm = try! Realm()

var userViewModel: UserViewModel = UserViewModel()

class UserViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    private var model = UserModel()
    
    init() {
        read()
    }
    
    func addNewAccount(_ username: String, _ password: String) {
        model.username = username
        model.password = password
        
        try! realm.write {
            realm.add(model)
        }
        
        read()
    }
    
    func accountVerification(_ username: String, _ password: String) -> Bool {
        for i in users {
            if (i.username == username && i.password == password) {
                return true
            }
        }
        return false
    }
    
    func read() {
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
}
