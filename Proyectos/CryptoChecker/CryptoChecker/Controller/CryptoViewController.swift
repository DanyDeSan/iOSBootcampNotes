//
//  ViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class CryptoViewController: UIViewController {
    
    lazy var cryptoTableView: UITableView = UITableView()
    var currencies: [Currency]? = [Currency](repeating: Currency(id: "", name: "name", minSize: "size"), count: 10)
    lazy var apiDataManager: APIDataManager<CurrencyListResponse> = APIDataManager<CurrencyListResponse>(endpoint: .currencies)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        makeNetworkCall()
    }
    
    func initUI() {
        title = Constants.currencyViewTitle
        view.addSubview(cryptoTableView)
        cryptoTableView.pinToBorders(with: view)
        cryptoTableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: CurrencyListTableViewCell.reuseIdentifier)
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        
    }
    
    func makeNetworkCall() {
        apiDataManager.performRequest { [weak self] currencyList in
            self?.currencies = currencyList.data
            self?.cryptoTableView.reloadData()
        } onError: { error in
            print(error)
        }
    }

}

extension CryptoViewController: UITableViewDelegate {
    
}

extension CryptoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CurrencyListTableViewCell = tableView.dequeueReusableCell(withIdentifier: CurrencyListTableViewCell.reuseIdentifier, for: indexPath) as? CurrencyListTableViewCell,
              let currency: Currency = currencies?[indexPath.row] else { return UITableViewCell() }
        cell.initUI(currency: currency)
        return cell
    }
}
