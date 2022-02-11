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
        view.backgroundColor = .white
        view.addSubview(cryptoTableView)
        cryptoTableView.pinToBorders(with: view)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currencies: [Currency] = self.currencies else { return UITableViewCell() }
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = currencies[indexPath.row].name
        return cell
    }
}
