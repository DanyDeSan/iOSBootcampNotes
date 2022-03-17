//
//  SignInViewDataManager.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

class SignInAPIDataManager: SignInViewAPIDataManagerProtocol {
    
    weak var viewModel: SignInViewAPIDataManagerOutputProtocol?
    private var dataTask: URLSessionDataTask?
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    
    func performSignIn(user: String, email: String, password: String) {
        let registerDTO: RegisterDTO = RegisterDTO(name: user, email: email, password: password, passwordConfirmation: password, deviceName: "\(user) device")
        dataTask?.cancel()
        dataTask = serviceBuilder.set(endpoint: .register(registerDTO))
            .set(completionHandler: {[weak self] response in
                switch response {
                case .success(let codableResult):
                    guard let responseObject: LoginRO = DataParser().parseData(data: codableResult) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.processSuccessResult(response: responseObject)
                    }
                case .fail(let networkError,let genericError):
                    DispatchQueue.main.async {
                        self?.processFailureResult(networkError: networkError, error: genericError)
                    }
                }
            })
            .createService()
        dataTask?.resume()
    }
    
    private func processSuccessResult(response: LoginRO) {
        self.viewModel?.didPerformSignIn(token: response.plainTextToken)
    }
    
    private func processFailureResult(networkError: NetworkError?, error: Error?) {
        
    }
}
