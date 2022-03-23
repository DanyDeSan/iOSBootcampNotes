//
//  LoginViewModel.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    weak var loginViewController: LoginViewControllerProtocol?
    var loginLocalDataManager: LoginLocalDataManagerProtocol? = LoginModuleLocalDataManager()
    var loginAPIDataManager: LoginAPIDataManagerProtocol? = LoginAPIDataManager()
    
    func setViewControllerConnection(viewController: LoginViewControllerProtocol) {
        self.loginViewController = viewController
    }
    
    func tapOnLoginButtonWithInputs(countersign: String?, userEmail: String?) {
        guard let countersign = countersign,
            let user = userEmail else {
            return
        }
        guard countersign != "",
              user != "" else {
            return
        }
        loginAPIDataManager?.viewModel = self
        loginAPIDataManager?.performLogin(userEmail: user, countersign: countersign)
    }
    
    func tapOnSignInButton() {
        loginViewController?.continueToSignInView()
    }
}

extension LoginViewModel: LoginAPIDataManagerOutputProtocol {
    func didPerformLogin(with bearerToken: String) {
        loginLocalDataManager?.store(bearerToken: bearerToken)
        loginViewController?.continueToUserDetailView()
    }
}
