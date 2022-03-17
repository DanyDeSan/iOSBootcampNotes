//
//  RegisterDTO.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

struct RegisterDTO: Codable {
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
    let deviceName: String
    
    enum CodingKeys: String, CodingKey {
        case name,email,password
        case passwordConfirmation = "password_confirmation"
        case deviceName = "device_name"
    }
}
