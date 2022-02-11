//
//  ExchangeRateViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    lazy var exchangesTableView: UITableView = UITableView()
    var cryptoSelected: Crypto?
    var apiDataManager: APIDataManager<ExchangeRateURLResponse>?
    var exchangeData: [ExchangeRateModel]?
    
    lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func requestInfo() {
        
    }
    
    func initActivityView() {
        
    }
    
    func removeActivityView() {
        
    }
    func initUI() {
        
        
    }
}

extension ExchangeRateViewController: UITableViewDelegate {
    
}

extension ExchangeRateViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
