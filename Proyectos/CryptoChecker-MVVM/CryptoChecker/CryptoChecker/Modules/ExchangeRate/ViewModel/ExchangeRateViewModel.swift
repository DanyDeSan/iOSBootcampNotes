//
//  ExchangeRateViewModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation

class ExchangeViewModel {
    var crypto: Crypto
    
    var apiDataManager: APIDataManager<ExchangeRateURLResponse>?
    var exchangeData: Observable<[ExchangeRateModel]> = Observable<[ExchangeRateModel]>([])
    var fetchingData: Observable<Bool> = Observable<Bool>(false)
    var didObtainError: Observable<Bool> = Observable<Bool>(false)
    
    var route: Observable<Route> = Observable<Route>(.none)
    
    init(crypto: Crypto) {
        self.crypto = crypto
    }
    
    init() {
        self.crypto = Crypto(name: "NA", abbreviation: "NA")
    }
    
    func requestInfo() {
        fetchingData.value = true
        apiDataManager = APIDataManager<ExchangeRateURLResponse>(endpoint: .exchange(currency: crypto.abbreviation))
        apiDataManager?.performRequest(completion: { result in
            self.fetchingData.value = false
            self.exchangeData.value = ExchangeRateModel.createFromResponseModel(result.data)
        }, onError: { error in
            self.fetchingData.value = false
            self.didObtainError.value = true
        })
    }
    
    func obtainNumberOfResults() -> Int {
        return exchangeData.value?.count ?? 0
    }
    
    func obtainModelAtIndex(index: Int) -> ExchangeRateModel {
        return exchangeData.value?[index] ?? ExchangeRateModel(currency: "", value: "")
    }
    
    func obtainViewTitle() -> String {
        return crypto.name
    }
    
    func didSelectRowAt(index: Int) {
        let data: ExchangeRateModel = exchangeData.value?[index] ?? ExchangeRateModel(currency: "", value: "")
        route.value = Route.sellBuy(firstCurrency: crypto.abbreviation, secondCurrency: data.currency)
    }
}
