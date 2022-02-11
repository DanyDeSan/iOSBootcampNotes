//
//  ViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class CryptoViewController: UIViewController {
    
    lazy var cryptoTableView: UITableView = UITableView()
    var availableCrypto: [Crypto] = [Crypto(name: "Bitcoin", abbreviation: "BTC"), Crypto(name: "Ethereum", abbreviation: "ETH"), Crypto(name: "Ripple", abbreviation: "XRT")]
    lazy var apiDataManager: APIDataManager<CurrencyListResponse> = APIDataManager<CurrencyListResponse>(endpoint: .currencies)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        
    }
    
}

extension CryptoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CryptoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
