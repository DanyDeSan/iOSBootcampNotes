//
//  SignInViewLocalDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class SignInViewLocalDataManager: SignInViewLocalDataManagerProtocol {
    
    private var userDefaults: UserDefaults = UserDefaults.standard
    
    func storeBearerToken(_ bearerToken: String) {
        userDefaults.setValue(bearerToken, forKey: "token")
    }
}
