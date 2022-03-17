//
//  LoginModuleAPIDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class LoginAPIDataManager: LoginAPIDataManagerProtocol {
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    weak var viewModel: LoginAPIDataManagerOutputProtocol?
    private var dataTask: URLSessionDataTask?
    
    
    func performLogin(userEmail: String, countersign: String) {
        dataTask?.cancel()
        let loginDTO: LoginDTO = LoginDTO(email: userEmail, countersign: countersign, deviceName: "\(userEmail) device")
        dataTask = serviceBuilder.set(endpoint: .login(loginDTO))
            .set(completionHandler: {[weak self] response in
                
                switch response {
                case .success(let data):
                    guard let responseObject: LoginRO = DataParser().parseData(data: data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.processSuccess(responseObject: responseObject)
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
    
    private func processSuccess(responseObject: LoginRO) {
        self.viewModel?.didPerformLogin(with: responseObject.plainTextToken)
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
}
