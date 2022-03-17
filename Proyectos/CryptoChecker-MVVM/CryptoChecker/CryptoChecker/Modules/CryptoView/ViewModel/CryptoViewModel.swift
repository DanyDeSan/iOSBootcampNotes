//
//  CryptoViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation


// The view model should not use UIKit!
final class CryptoViewModel: CryptoViewModelProtocol {
    
    
    // Local data manager
    var localDataManager: CryptoViewLocalDataManagerProtocol
    
    // Observable variables
    var cryptoDataSource: Observable<[Crypto]>
    var route: Observable<Route>
    var newCryptoCurrency: Observable<Crypto>?
    
    init(localDataManager: CryptoViewLocalDataManagerProtocol,
         route: Observable<Route>,
         newCryptoCurrency: Observable<Crypto>,
         cryptoDataSource: Observable<[Crypto]> ) {
        self.localDataManager = localDataManager
        self.route = route
        self.newCryptoCurrency = newCryptoCurrency
        self.cryptoDataSource = cryptoDataSource
    }
    
    
    func obtainAvailableCryptos() {
        let crypto: [Crypto] = localDataManager.obtainAvailableCryptos()
        cryptoDataSource.value = crypto
    }
    
    func obtainCrypto(at index: Int) -> Crypto {
        return cryptoDataSource.value?[index] ?? Crypto(name: "Not defined", abbreviation: "NA")
    }
    
    func obtainNumberOfAvailableCryptos() -> Int {
        return cryptoDataSource.value?.count ?? 0
    }
    
    func didSelectCell(at index: Int) {
        let selectedCrypto: Crypto = cryptoDataSource.value?[index] ?? Crypto(name: "NA", abbreviation: "NA")
        let route: Route = Route.exchangeView(crypto: selectedCrypto)
        self.route.value = route
    }
    
    func didTappedBarButton() {
        newCryptoCurrency = Observable<Crypto>(Crypto(name: "", abbreviation: ""))
        newCryptoCurrency?.valueChanged = { crypto in
            print(crypto)
        }
        
        let route: Route = Route.newItemAlert(title: Constants.addNewCryptoCurrencyTitle, observer: newCryptoCurrency!) { [weak self] in
            guard let self = self,
                  let newCrypto: Observable<Crypto> = self.newCryptoCurrency,
                  var dataSource: [Crypto] = self.cryptoDataSource.value
            else { return }
            dataSource.append(newCrypto.value!)
            self.cryptoDataSource.value = dataSource
            self.newCryptoCurrency = nil
        }
        
        self.route.value = route
    }
}
