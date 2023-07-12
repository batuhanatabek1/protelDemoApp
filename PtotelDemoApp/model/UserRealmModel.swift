//
//  UserRealmModel.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 10.07.2023.
//

import Foundation
import RealmSwift

class UserRealmModel: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var phone: String
    @Persisted var city: String
    @Persisted var country: String
    @Persisted var picture: String
    @Persisted var birthday: String
    @Persisted var email: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
