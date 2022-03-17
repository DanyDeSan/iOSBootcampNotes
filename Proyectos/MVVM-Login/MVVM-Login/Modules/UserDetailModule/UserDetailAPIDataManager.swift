//
//  UserDetailAPIDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class UserDetailAPIDataManager: UserDetailAPIDataManagerProtocol {
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    private var dataTask: URLSessionDataTask?
    weak var viewModel: UserDetailAPIDataManagerOutputProtocol?
    
    func fetchUserData(with bearer: String) {
        dataTask?.cancel()
        dataTask = serviceBuilder.set(endpoint: .authenticatedUser(token: bearer))
            .set(completionHandler: {[weak self] response in
                switch response {
                case .success(let data):
                    guard let userRO: UserRO = DataParser().parseData(data: data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.processSuccessData(userRO: userRO)
                    }
                case .fail(let networkError, let error):
                    DispatchQueue.main.async {
                        self?.processFailure(networkError: networkError, error: error)
                    }
                }
            })
            .createService()
        dataTask?.resume()
    }
    
    private func processSuccessData(userRO: UserRO) {
        self.viewModel?.didObtainedUserData(user: userRO)
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
    
    func performLogOut(with bearer: String) {
        dataTask?.cancel()
        dataTask = serviceBuilder.set(endpoint: .logoutUser(token: bearer))
            .createService()
        dataTask?.resume()
        viewModel?.didLogOutUser()
    }
    
}
