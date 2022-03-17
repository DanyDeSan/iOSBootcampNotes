//
//  SignInViewModel.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class SignInViewModel: SignInViewModelProtocol {
    
    weak var viewController: SignInViewControllerProtocol?
    var apiDataManager: SignInViewAPIDataManagerProtocol? = SignInAPIDataManager()
    var localDataManager: SignInViewLocalDataManagerProtocol? = SignInViewLocalDataManager()
    
    func setConnection(with viewController: SignInViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func onSignInButtonTap(user: String, email: String, countersign: String, confirmCountersign: String) {
        guard countersign == confirmCountersign else { return }
        apiDataManager?.viewModel = self
        apiDataManager?.performSignIn(user: user, email: email, password: countersign)
    }
    
    func onCancelButtonTap() {
        viewController?.dismissToLogin()
    }
}

extension SignInViewModel: SignInViewAPIDataManagerOutputProtocol {
    func didPerformSignIn(token: String) {
        localDataManager?.storeBearerToken(token)
        viewController?.continueToUserDetailView()
    }
}
