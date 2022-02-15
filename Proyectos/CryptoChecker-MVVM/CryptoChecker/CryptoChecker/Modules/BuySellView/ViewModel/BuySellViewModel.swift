//
//  BuySellViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 15/02/22.
//

import Foundation

class BuySellViewModel {
    
    let crypto: String
    let secondCurrency: String
    
    var sellAPIDataManager: APIDataManager<SellBuyResponseData>?
    var buyAPIDataManager: APIDataManager<SellBuyResponseData>?
    
    var sellDataObserver: Observable<SellBuyModel> = Observable<SellBuyModel>(SellBuyModel(currency: "", amount: ""))
    
    var buyDataObserver: Observable<SellBuyModel> = Observable<SellBuyModel>(SellBuyModel(currency: "", amount: ""))
    
    init() {
        self.crypto = ""
        self.secondCurrency = ""
    }
    
    init(crypto: String, secondCurrency: String) {
        self.crypto = crypto
        self.secondCurrency = secondCurrency
    }
    
    func fetchData() {
        sellAPIDataManager = APIDataManager<SellBuyResponseData>(endpoint: .sell(frstCurrency: crypto, scndCurrency: secondCurrency))
        buyAPIDataManager = APIDataManager<SellBuyResponseData>(endpoint: .buy(frstCurrency: crypto, scndCurrency: secondCurrency))
        
        sellAPIDataManager?.performRequest(completion: { [weak self] sellBuyResponseData in
            self?.sellDataObserver.value = SellBuyModel.createModel(from: sellBuyResponseData)
        }, onError: { error in
            print(error)
        })
        
        buyAPIDataManager?.performRequest(completion: { [weak self] buyResponseData in
            self?.buyDataObserver.value = SellBuyModel.createModel(from: buyResponseData)
        }, onError: { Error in
            print(Error)
        })
    }
    
    func obtainViewTitle() -> String {
        return "\(crypto)-\(secondCurrency)"
    }
}
