//
//  ExchangeRatesResponse.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

// MARK: - Currencies
struct ExchangeRateURLResponse: Codable {
    let data: ExchangeRatesData
}

// MARK: - DataClass
struct ExchangeRatesData: Codable {
    let currency: String
    let rates: [String: String]
}
