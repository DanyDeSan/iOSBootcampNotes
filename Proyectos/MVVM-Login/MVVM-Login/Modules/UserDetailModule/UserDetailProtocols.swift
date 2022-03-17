//
//  UserDetailProtocols.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation
import UIKit

protocol UserDetailViewModelProtocol {
    var apiDataManager: UserDetailAPIDataManagerProtocol? { get set }
    var localDataManager: UserDetailLocalDataManagerProtocol? { get set }
    var viewController: UserDetailViewControllerProtocol? { get set }
    
    func setViewControllerConnection(_ viewController: UserDetailViewControllerProtocol)
    func fetchUserData()
    func onLogOutTap()
}

protocol UserDetailViewControllerProtocol: UIViewController {
    var viewModel: UserDetailViewModelProtocol? { get set }
    
    func setViewModelConnection(_ viewModel: UserDetailViewModelProtocol)
    func updateUIWithInfo(user: String, email: String, id: String)
    func dismissToLogin() 
}

protocol UserDetailAPIDataManagerProtocol {
    var viewModel: UserDetailAPIDataManagerOutputProtocol? { get set }
    
    func fetchUserData(with bearer: String)
    func performLogOut(with bearer: String)
}

protocol UserDetailAPIDataManagerOutputProtocol: AnyObject {
    func didObtainedUserData(user: UserRO)
    func didLogOutUser()
}

protocol UserDetailLocalDataManagerProtocol {
    func obtainStoredToken() -> String?
}
