//
//  CryptoViewLocalDataManager.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation


// This class is responable to fetch all the local data for the ViewModel
final class CryptoViewLocalDataManager: CryptoViewLocalDataManagerProtocol {
    func obtainAvailableCryptos() -> [Crypto] {
        return [Crypto(name: "Bitcoin", abbreviation: "BTC"),
                Crypto(name: "Ethereum", abbreviation: "ETH"),
                Crypto(name: "Ripple", abbreviation: "XTH")]
    }
}
