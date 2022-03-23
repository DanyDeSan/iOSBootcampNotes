//
//  LoginModuleLocalDataManagerSpy.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 18/03/22.
//

import Foundation
@testable import MVVM_Login

class LoginModuleLocalDataManagerSpy: LoginLocalDataManagerProtocol {
    
    var didCalledStore: Bool = false
    
    func store(bearerToken: String) {
        didCalledStore = true
    }
}
