//
//  CryptoViewProtocols.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation
import UIKit

protocol CryptoViewLocalDataManagerProtocol {
    func obtainAvailableCryptos() -> [Crypto]
}

protocol CryptoViewModelProtocol {
    
    // MARK: - Observables
    var cryptoDataSource: Observable<[Crypto]> { get set }
    var route: Observable<Route> { get set }
    
    // MARK: - UI Events
    func didTappedBarButton()
    
    // MARK: - Fetch Methods
    func obtainAvailableCryptos()
    
    // MARK: - TableViewMethods
    func obtainCrypto(at: Int) -> Crypto
    func obtainNumberOfAvailableCryptos() -> Int
    func didSelectCell(at: Int)
}
