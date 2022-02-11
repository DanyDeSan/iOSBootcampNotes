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
    }
}
