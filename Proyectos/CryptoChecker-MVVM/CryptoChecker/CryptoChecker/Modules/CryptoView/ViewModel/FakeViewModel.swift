//
//  FakeViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 16/03/22.
//

import Foundation

class FakeViewModel: CryptoViewModelProtocol {
    
    var cryptoDataSource: Observable<[Crypto]>
    
    var route: Observable<Route>
    
    init(cryptoDataSource: Observable<[Crypto]>, route: Observable<Route>) {
        self.cryptoDataSource = cryptoDataSource
        self.route = route
    }
    
    func didTappedBarButton() {
        
    }
    
    func obtainAvailableCryptos() {
        print("Im pretending that im doing something")
    }
    
    func obtainCrypto(at: Int) -> Crypto {
        return Crypto(name: "", abbreviation: "")
    }
    
    func obtainNumberOfAvailableCryptos() -> Int {
        return 1
    }
    
    func didSelectCell(at: Int) {
        print(at)
    }
    
    
}
