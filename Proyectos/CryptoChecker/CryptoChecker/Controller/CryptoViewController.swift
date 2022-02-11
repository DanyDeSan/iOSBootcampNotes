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
        title = Constants.currencyViewTitle
        view.addSubview(cryptoTableView)
        cryptoTableView.pinToBorders(with: view)
        cryptoTableView.register(ReusableTableViewCell.self, forCellReuseIdentifier: ReusableTableViewCell.reuseIdentifier)
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
    }
    
}

extension CryptoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let crypto: Crypto = availableCrypto[indexPath.row]
        let nextViewController = ExchangeRateViewController()
        nextViewController.cryptoSelected = crypto
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension CryptoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableCrypto.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ReusableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reuseIdentifier, for: indexPath) as? ReusableTableViewCell else {
            return UITableViewCell()
        }
        let currency: Crypto = availableCrypto[indexPath.row]
        cell.initUI(model: currency)
        return cell
    }
}
