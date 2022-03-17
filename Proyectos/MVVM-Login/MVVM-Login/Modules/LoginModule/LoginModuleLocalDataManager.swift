//
//  LoginModuleLocalDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class LoginModuleLocalDataManager: LoginLocalDataManagerProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    func store(bearerToken: String) {
        userDefaults.setValue(bearerToken, forKey: "token")
    }
}
