//
//  UserDetailViewModel.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class UserDetailViewModel: UserDetailViewModelProtocol {
    
    var apiDataManager: UserDetailAPIDataManagerProtocol? = UserDetailAPIDataManager()
    var localDataManager: UserDetailLocalDataManagerProtocol? = UserDetailLocalDataManager()
    weak var viewController: UserDetailViewControllerProtocol?
    
    func setViewControllerConnection(_ viewController: UserDetailViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func fetchUserData() {
        guard let token: String = localDataManager?.obtainStoredToken() else {
            return 
        }
        apiDataManager?.viewModel = self
        apiDataManager?.fetchUserData(with: token)
    }
    
    func onLogOutTap() {
        guard let token: String = localDataManager?.obtainStoredToken() else {
            return
        }
        apiDataManager?.viewModel = self
        apiDataManager?.performLogOut(with: token)
    }
}

extension UserDetailViewModel: UserDetailAPIDataManagerOutputProtocol {    
    func didObtainedUserData(user: UserRO) {
        viewController?.updateUIWithInfo(user: user.name, email: user.email, id: user.id)
    }
    
    func didLogOutUser() {
        viewController?.dismissToLogin()
    }
}
