//
//  Constant.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import UIKit

class Constant {
    static let baseUrl = "https://randomuser.me/api/?results=20"
}

struct Constants {
    struct Networkconstants {
        static let baseUrl = String()
    }
    struct TextConstants {
        static let ok = "Okey"
        static let fail = "Fail"
        static let failDesc = "Please check username and password."
    }
    
    struct PerformSegues {
        static let list = "toList"
        static let detail = "toDetail"
    }
    
    struct Image {
        static let placeHolder = UIImage(named: "placeHolder")
    }
    struct LoginData {
        static let validUserNames = ["9nd54","v542w", "17pcy0", "gbf48", "zdah4"]
        static let validPasswords = ["12345"]
    }
}
