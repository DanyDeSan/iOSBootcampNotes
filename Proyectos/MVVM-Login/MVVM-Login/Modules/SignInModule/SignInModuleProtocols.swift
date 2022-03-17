//
//  SignInViewProtocol.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation
import UIKit

protocol SignInViewModelProtocol {
    var viewController: SignInViewControllerProtocol? { get set }
    var apiDataManager: SignInViewAPIDataManagerProtocol? { get set }
    var localDataManager: SignInViewLocalDataManagerProtocol? { get set }
    
    func setConnection(with viewController: SignInViewControllerProtocol)
    func onSignInButtonTap(user: String, email: String, countersign: String, confirmCountersign: String)
    func onCancelButtonTap()
}

protocol SignInViewControllerProtocol: UIViewController {
    var viewModel: SignInViewModelProtocol? { get set }
    func setConnection(with viewModel: SignInViewModelProtocol)
    func continueToUserDetailView()
    func dismissToLogin()
}

protocol SignInViewAPIDataManagerProtocol {
    var viewModel: SignInViewAPIDataManagerOutputProtocol? { get set }
    func performSignIn(user: String, email: String, password: String) 
}

protocol SignInViewAPIDataManagerOutputProtocol: AnyObject {
    func didPerformSignIn(token: String)
}

protocol SignInViewLocalDataManagerProtocol {
    func storeBearerToken(_ bearerToken: String) 
}
