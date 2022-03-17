//
//  UserDetailLocalDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class UserDetailLocalDataManager: UserDetailLocalDataManagerProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    func obtainStoredToken() -> String? {
        guard let tokens = userDefaults.value(forKey: "token") as? String else { return nil }
        return tokens
    }
    
}
