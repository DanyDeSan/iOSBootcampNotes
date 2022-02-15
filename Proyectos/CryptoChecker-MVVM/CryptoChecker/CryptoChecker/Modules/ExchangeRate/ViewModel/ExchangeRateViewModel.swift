//
//  ExchangeRateViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation

class ExchangeViewModel {
    var crypto: Crypto
    
    init(crypto: Crypto) {
        self.crypto = crypto
    }
    
    init() {
        self.crypto = Crypto(name: "NA", abbreviation: "NA")
    }
    
}
