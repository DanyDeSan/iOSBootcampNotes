//
//  ServicesBuilderProtocol.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 15/03/22.
//

import Foundation

protocol ServicesBuilderProtocol {
    
    func set(endpoint: Endpoint) -> ServicesBuilderProtocol
    func createService() -> URLSessionDataTask?
    func set(completionHandler: @escaping (Response) -> ()) -> ServicesBuilderProtocol
}

class ServiceBuilder: ServicesBuilderProtocol {
    private var session: URLSession
    private var currentEndpoint: Endpoint?
    private var completionHandler: ((Response) -> Void)?
    private var errorHandler: ((Error) -> ())?
    private lazy var urlBase: URL? = URL(string: "https://playground-bookstore.herokuapp.com/api/v1/")
    
    init() {
        self.session = URLSession.shared
    }
    
    func set(endpoint: Endpoint) -> ServicesBuilderProtocol {
        self.currentEndpoint = endpoint
        return self
    }
        
    func set(completionHandler: @escaping (Response) -> ()) -> ServicesBuilderProtocol {
        self.completionHandler = completionHandler
        return self
    }
    
    private func obtainParameters() -> Data? {
        guard let currentEndpoint = currentEndpoint else {
            return nil
        }
        var data: Data?
        let jsonEncoder: JSONEncoder = JSONEncoder()
        
        switch currentEndpoint {
        case .login(let loginDTO):
            data = try? jsonEncoder.encode(loginDTO)
        case .register(let registerDTO):
            data = try? jsonEncoder.encode(registerDTO)
        case .authenticatedUser, .logoutUser:
            return nil
        }
        return data
    }
    
    private func setAuthorization(request: inout URLRequest) {
        guard let currentEndpoint = currentEndpoint else {
            return
        }
        switch currentEndpoint {
        case .authenticatedUser(let token):
            let completeToken: String = "bearer \(token)"
            request.addValue(completeToken, forHTTPHeaderField: "Authorization")
        default:
            return
        }
    }
    
    private func obtainBearer() -> String? {
        guard let currentEndpoint = currentEndpoint else {
            return nil
        }
        
        switch currentEndpoint {
        case .authenticatedUser(let token):
            return "Bearer \(token)"
        case.logoutUser(let token):
            return "Bearer \(token)"
        default:
            return nil
        }

    }
    
    func createService() -> URLSessionDataTask? {
        guard let currentEndpoint: Endpoint = currentEndpoint,
              var url: URL = self.urlBase else { return nil }
        // Aqui agrego el enpoint a nuestra URL base
        url.appendPathComponent(currentEndpoint.path)
        // Creamos el request usando la url base
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        // Agregando headers
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        // Agregar header de autenticación, en caso de que se tenga un beaerer token.
        // El bearer token es la llave para que nos identifiquemos con
        // el servicio.
        if let bearer: String = obtainBearer() {
            request.addValue(bearer, forHTTPHeaderField: "Authorization")
        }
        // Si es de tipo GET o POST
        request.httpMethod = currentEndpoint.method
        // Aqui codificamos los parametros que se le van a enviar a la API
        request.httpBody = obtainParameters()
        // data task
        let dataTask: URLSessionDataTask = session.dataTask(with: request) {[weak self] data, response, error in
            guard let response = response as? HTTPURLResponse else {
                self?.completionHandler?(.fail(.unrecognized, error))
                return
            }
            guard response.statusCode == 200 else {
                self?.completionHandler?(.fail(NetworkError.networkErrorFrom(statusCode: response.statusCode), error))
                return
            }
            guard let data = data else {
                self?.completionHandler?(.fail(.unrecognized, nil))
                return
            }
            self?.completionHandler?(.success(data))
        }
        return dataTask
    }
}
