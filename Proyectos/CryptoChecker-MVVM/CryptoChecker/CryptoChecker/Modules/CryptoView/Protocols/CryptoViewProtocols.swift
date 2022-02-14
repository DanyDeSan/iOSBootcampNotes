//
//  CryptoViewProtocols.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation
import UIKit

protocol CryptoViewModelProtocol {
    var cryptoDataSource: Observable<[Crypto]> { get set }
    func obtainAvailableCryptos()
}

protocol CryptoViewLocalDataManagerProtocol {
    func obtainAvailableCryptos() -> [Crypto]
}
