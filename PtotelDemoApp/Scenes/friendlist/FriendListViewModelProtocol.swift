//
//  FriendListViewModelProtocol.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import Foundation

protocol FriendListViewModelProtocol {
    var userArray: [UserModel] { get }
    var delegate: FriendListViewModelDelegate? { get set }
    var checkConnection: Bool { get set }
    var realmUserArray: [UserRealmModel] { get set }
    func fetchUserData()
    func getRealmData()
    func checkInternetConnection()
    func getUserModel(realmUserModel: UserRealmModel?) -> UserModel?
}
