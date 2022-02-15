//
//  APIDataManager.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

class APIDataManager<DataExpected: Codable> {
    
    let endpoint: EndPoint
    
    lazy var urlSession: URLSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var dataParser: DataParser<DataExpected> = DataParser<DataExpected>()
    
    init(endpoint: EndPoint) {
        self.endpoint = endpoint
    }
    
    func performRequest(completion: @escaping (DataExpected) -> Void, onError: @escaping (Error?) -> Void) {
        guard let completeURL = endpoint.completeURL else {
            // En caso de que no pudimos obtener el url invocamos el error.
            onError(nil)
            return
        }
        // Cancelamos cualquier peticion anterior
        dataTask?.cancel()
        // Por medio de url session creamos una nueva petición
        dataTask = urlSession.dataTask(with: completeURL, completionHandler: { responseData , responseURL, error in
            if let error = error {
                // Tenemos que regresarnos al main para actualizar al controller con el error
                DispatchQueue.main.async {
                    onError(error)
                }
            }
            
            // Checamos que los datos existan, que el status code sea 200 y obtenemos los datos parseados.
            guard let data: Data = responseData,
                  let response: HTTPURLResponse = responseURL as? HTTPURLResponse,
                  response.statusCode == 200,
                  let parsedData: DataExpected = self.dataParser.parseData(data: data) else {
                      DispatchQueue.main.async {
                          onError(error)
                      }
                      return
                  }
            DispatchQueue.main.async {
                completion(parsedData)
            }
        })
        // Ejecutamos la petición
        dataTask?.resume()
    }
}
