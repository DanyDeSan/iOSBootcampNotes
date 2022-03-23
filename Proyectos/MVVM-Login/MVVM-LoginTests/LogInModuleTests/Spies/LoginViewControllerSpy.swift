//
//  LoginViewControllerSpy.swift
//  MVVM-LoginTests
//
//  Created by L Daniel De San Pedro on 18/03/22.
//

import Foundation
@testable import MVVM_Login
import UIKit

class LoginViewControllerSpy: UIViewController, LoginViewControllerProtocol {
    var didCalledSetViewModelConnection: Bool = false
    var didCalledContinueToUserDetailView: Bool = false
    var didCalledContinueToSignInView: Bool = false
    
    var loginViewModel: LoginViewModelProtocol?
    
    func setViewModelConnection(viewModel: LoginViewModelProtocol) {
        didCalledSetViewModelConnection = true
    }
    
    func continueToUserDetailView() {
        didCalledContinueToUserDetailView = true
    }
    
    func continueToSignInView() {
        didCalledContinueToSignInView = true
    }
}
