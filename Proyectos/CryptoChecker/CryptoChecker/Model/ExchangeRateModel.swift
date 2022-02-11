//
//  ExchangeRateModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

struct ExchangeRateModel {
    var currency: String
    var value: String
    
    static func createFromResponseModel(_ responseModel: ExchangeRatesData) -> [ExchangeRateModel]? {
        let exchangesFetched: [ExchangeRateModel]? =  responseModel.rates.map { (currency, value) in
            return ExchangeRateModel(currency: currency, value: value)
        }
        return exchangesFetched
    }
}

extension ExchangeRateModel: TableViewCellVieable {
    var title: String {
        return currency
    }    
    var subTitle: String {
        return value
    }
    
}
