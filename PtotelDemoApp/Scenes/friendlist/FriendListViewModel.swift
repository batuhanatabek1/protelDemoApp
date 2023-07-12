//
//  FriendListViewModel.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import Foundation
import RealmSwift

class FriendListViewModel: FriendListViewModelProtocol {
    var realmUserArray: [UserRealmModel]
    var checkConnection: Bool
    var delegate: FriendListViewModelDelegate?
    var userArray: [UserModel]
    
    init(userArray: [UserModel] = [], checkConnection: Bool = true, realmUserArray: [UserRealmModel] = []) {
        self.userArray = userArray
        self.checkConnection = checkConnection
        self.realmUserArray = realmUserArray
    }
    
    func deleteAllData() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
                print("Tüm veriler başarıyla silindi.")
            }
        } catch {
            print("Veriler silinirken hata oluştu: (error)")
        }
    }
    
    func getRealmData() {
        let realm = try! Realm()
        let user = realm.objects(UserRealmModel.self)
        for index in user {
            self.realmUserArray.append(index)
        }
        self.delegate?.showList()
    }
    
    func checkInternetConnection() {
        if Reachability.isConnectedToNetwork(){
            fetchUserData()
            self.checkConnection = true
        } else {
            getRealmData()
            self.checkConnection = false
        }
    }
    
    func getUserModel(realmUserModel: UserRealmModel?) -> UserModel? {
        guard let realmUserModel else { return nil }
        var userModel = UserModel()
        userModel.name = Name(title: nil, first: realmUserModel.firstName, last: realmUserModel.lastName)
        userModel.picture = Picture(large: realmUserModel.picture, medium: nil, thumbnail: nil)
        userModel.phone = realmUserModel.phone
        userModel.email = realmUserModel.email
        userModel.location = Location(street: nil, city: realmUserModel.city, state: nil, country: realmUserModel.country, postcode: nil, coordinates: nil, timezone: nil)
        userModel.dob = Dob(date: realmUserModel.birthday, age: nil)
        return userModel
    }
    
    func fetchUserData() {
        Service.getUserData { result in
            switch result {
            case .success(let success):
                self.userArray = success
                self.deleteAllData()
                var users: [UserRealmModel] = []
                var counter = 0
                for index in self.userArray {
                    let user = UserRealmModel()
                    user._id = "\(counter)"
                    user.firstName = index.name?.first ?? String()
                    user.lastName = index.name?.last ?? String()
                    user.phone = index.phone ?? String()
                    user.city = index.location?.city ?? String()
                    user.country = index.location?.country ?? String()
                    user.picture = index.picture?.large ?? String()
                    user.email = index.email ?? String()
                    user.birthday = index.dob?.date ?? String()
                    counter += 1
                    users.append(user)
                }
                let realm = try! Realm()
                try! realm.write({
                    realm.add(users)
                })
                self.delegate?.showList()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
