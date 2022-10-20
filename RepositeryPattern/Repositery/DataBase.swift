//
//  DataBase.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 19/10/2022.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var userID: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

final class Database {
    
    func save(_ users: [UserData]) {
        let realm = try! Realm()
        do {
            try realm.write {
                
                users.forEach { user in
                    
                    let object = User()
                    object.id = user.id
                    object.userID = user.userID
                    object.title = user.title
                    object.body = user.body
                    realm.add(object , update: .all)
                }
            }
            
        } catch {
            print("Save Error",error.localizedDescription)
        }
    }
    
    func getUsers() -> [UserData] {
        
        let realm = try! Realm()
        
        return realm.objects(User.self).map { object in
            return UserData(userID: object.userID, id: object.id, title: object.title, body: object.body)
        }
    }
    
}
