//
//  Service.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import Foundation
import Alamofire

class Service {
    static func getUserData(completionHandler: @escaping (Result<[UserModel], Error>) -> Void) {
        AF.request(Constant.baseUrl, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                do {
                    let response = try JSONDecoder().decode(Results.self, from: value)
                    completionHandler(.success(response.results ?? []))
                } catch (let error){
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
