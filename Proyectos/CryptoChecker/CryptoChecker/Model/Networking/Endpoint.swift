//
//  Endpoint.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

enum EndPoint {
    case currencies
    case exchange(currency: String)
    case sell(frstCurrency: String, scndCurrency: String)
    case buy(frstCurrency: String, scndCurrency: String)
    
    var baseURLComponent: URLComponents {
        var components: URLComponents = URLComponents()
        components.scheme = "https"
        components.host = "api.coinbase.com"
        components.path = "/v2"
        return components
    }
    
    var completeURL: URL? {
        var baseURL: URLComponents = baseURLComponent
        switch self {
        case .currencies:
            baseURL.path += "/currencies"
        case .exchange(currency: let currency):
            let queryItem: URLQueryItem = URLQueryItem(name: "currency", value: currency)
            baseURL.queryItems = [queryItem]
        case .sell(frstCurrency: let frstCurrency, scndCurrency: let scndCurrency):
            let completePath: String = "/\(frstCurrency)-\(scndCurrency)/sell"
            baseURL.path += completePath
        case .buy(frstCurrency: let frstCurrency, scndCurrency: let scndCurrency):
            let completePath: String = "/\(frstCurrency)-\(scndCurrency)/buy"
            baseURL.path += completePath
        }
        return baseURL.url
    }
}
