import Foundation
import RealmSwift

class UserModel: Object {
    @objc dynamic var username = ""
    @objc dynamic var password = ""
    @objc dynamic var isVK = false
    @objc dynamic var id = ""
}

