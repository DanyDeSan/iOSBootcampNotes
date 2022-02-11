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
        guard let completeEndpointURL: URL = endpoint.completeURL else {
            onError(nil)
            return
        }
        dataTask?.cancel()

        dataTask = urlSession.dataTask(with: completeEndpointURL, completionHandler: { [weak self] responseData, urlResponse, error in
            if let error = error {
                DispatchQueue.main.async {
                    onError(error)
                }
                return
            }
            guard let data: Data = responseData,
                  let response: HTTPURLResponse = urlResponse as? HTTPURLResponse,
                  response.statusCode == 200,
                  let parsedData: DataExpected = self?.dataParser.parseData(data: data) else {
                      DispatchQueue.main.async {
                          onError(error)
                      }
                      return
                  }
            DispatchQueue.main.async {
                completion(parsedData)
            }
        })
        dataTask?.resume()
    }
}
