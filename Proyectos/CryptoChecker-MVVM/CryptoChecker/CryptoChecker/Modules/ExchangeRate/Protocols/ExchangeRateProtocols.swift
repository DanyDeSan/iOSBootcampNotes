//
//  ExchangeRateProtocols.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 16/03/22.
//

import Foundation

// Abstraction of the view model
protocol ExchangeRateViewModelProtocol {
    
    // Observables
    var fetchingData: Observable<Bool> { get set }
    var exchangeData: Observable<[ExchangeRateModel]> { get set }
    var didObtainError: Observable<Bool> { get set}
    var route: Observable<Route> { get set }
    
    // Data manager
    var apiDataManager: APIDataManager<ExchangeRateURLResponse>? { get set }
    
    // Obtain methods
    func obtainViewTitle() -> String
    func obtainNumberOfResults() -> Int
    func obtainModelAtIndex(index: Int) -> ExchangeRateModel
    // TableView
    func didSelectRowAt(index: Int)
    // Fetch data
    func requestInfo()
}
