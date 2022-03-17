//
//  LoginRO.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

struct LoginRO: Codable {
    let plainTextToken: String
    enum CodingKeys: String, CodingKey {
        case plainTextToken = "plain-text-token"
    }
}
