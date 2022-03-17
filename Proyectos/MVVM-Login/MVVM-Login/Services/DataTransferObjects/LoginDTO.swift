//
//  LoginDTO.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

struct LoginDTO: Codable {
    let email: String
    let countersign: String
    let deviceName: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case countersign = "password"
        case deviceName = "device_name"
    }
}


