//
//  SellBuyModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 15/02/22.
//

import Foundation

struct SellBuyModel {
    var currency: String
    var amount: String
    
    static func createModel(from dataResponseModel: SellBuyResponseData) -> SellBuyModel {
        return SellBuyModel(currency: dataResponseModel.data.currency, amount: dataResponseModel.data.amount)
    }
}

extension SellBuyModel: RateViewable {
    var title: String {
        return currency
    }
    
    var value: String {
        return amount
    }
}
