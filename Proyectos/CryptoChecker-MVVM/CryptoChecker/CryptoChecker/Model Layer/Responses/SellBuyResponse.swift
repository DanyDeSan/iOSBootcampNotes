//
//  SellBuy.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 15/02/22.
//

import Foundation

// MARK: - SellBuyResponseData
struct SellBuyResponseData: Codable {
    let data: SellBuyData
}

// MARK: - SellBuyData
struct SellBuyData: Codable {
    let base, currency, amount: String
}
