//
//  LoginModuleAPIDataManagerSpy.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 18/03/22.
//

import Foundation
@testable import MVVM_Login

class LoginModuleAPIDataManagerSpy: LoginAPIDataManagerProtocol {
    var didPerformLogin: Bool = false
    
    var viewModel: LoginAPIDataManagerOutputProtocol?
    
    func performLogin(userEmail: String, countersign: String) {
        didPerformLogin = true
        viewModel?.didPerformLogin(with: "fake")
    }
}
