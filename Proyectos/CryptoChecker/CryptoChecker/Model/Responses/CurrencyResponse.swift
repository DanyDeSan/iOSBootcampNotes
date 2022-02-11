//
//  CurrencyResponse.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

struct CurrencyListResponse: Codable {
    let data: [Currency]
}

struct Currency: Codable {
    let id: String
    let name: String
    let minSize: String
    
    enum CodingKeys: String, CodingKey {
        case id,name
        case minSize = "min_size"
    }
}
