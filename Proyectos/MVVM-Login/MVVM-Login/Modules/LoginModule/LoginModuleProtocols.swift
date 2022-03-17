//
//  LoginModuleProtocols.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation
import UIKit

protocol LoginViewModelProtocol {
    var loginViewController: LoginViewControllerProtocol? { get set }
    var loginAPIDataManager: LoginAPIDataManagerProtocol? { get set }
    var loginLocalDataManager: LoginLocalDataManagerProtocol? { get set }
    
    func setViewControllerConnection(viewController: LoginViewControllerProtocol)
    func tapOnLoginButtonWithInputs(countersign: String?, userEmail: String?)
    func tapOnSignInButton()
}

protocol LoginViewControllerProtocol: UIViewController {
    var loginViewModel: LoginViewModelProtocol? { get set }
    func setViewModelConnection(viewModel: LoginViewModelProtocol)
    func continueToUserDetailView()
    func continueToSignInView()
}

protocol LoginAPIDataManagerProtocol {
    var viewModel: LoginAPIDataManagerOutputProtocol? { get set }
    func performLogin(userEmail: String, countersign: String)
}

protocol LoginAPIDataManagerOutputProtocol: AnyObject {
    func didPerformLogin(with bearerToken: String)
}

protocol LoginLocalDataManagerProtocol {
    func store(bearerToken: String)
}
