//
//  CryptoViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation

final class CryptoViewModel: CryptoViewModelProtocol {
    
    // Local data manager
    var localDataManager: CryptoViewLocalDataManagerProtocol
    
    // Observable variables
    var cryptoDataSource: Observable<[Crypto]> = Observable<[Crypto]>([Crypto]())
    
    init(localDataManager: CryptoViewLocalDataManagerProtocol) {
        self.localDataManager = localDataManager
    }
    
    func obtainAvailableCryptos() {
        let crypto: [Crypto] = localDataManager.obtainAvailableCryptos()
        cryptoDataSource.value = crypto
    }
}
