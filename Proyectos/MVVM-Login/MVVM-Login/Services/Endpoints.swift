//
//  Endpoints.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

enum Endpoint {
    case login(LoginDTO)
    case register(RegisterDTO)
    case authenticatedUser(token: String)
    case logoutUser(token: String)
    
    var path: String {
        switch self {
        case .login(_): return "login"
        case .register(_): return "register"
        case .authenticatedUser(_): return "user"
        case .logoutUser(_): return "logout"
        }
    }
    
    var method: String {
        switch self {
        case .login(_), .register(_), .logoutUser(_):
            return "POST"
        case .authenticatedUser(_):
            return "GET"
        }
    }
    
}

