//
//  ViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class CryptoViewController: UIViewController {
    // Declarando una variable lazy, solo se crea cuando se usa.
    lazy var cryptoTableView: UITableView = UITableView()
    
    var availableCrypto: [Crypto] = [Crypto(name: "Bitcoin", abbreviation: "BTC"), Crypto(name: "Ethereum", abbreviation: "ETH"), Crypto(name: "Ripple", abbreviation: "XRT")]
    lazy var apiDataManager: APIDataManager<CurrencyListResponse> = APIDataManager<CurrencyListResponse>(endpoint: .currencies)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        self.view.applyBackgroundColor()
        self.title = Constants.currencyViewTitle
        // Agregamos table view a la view
        self.view.addSubview(cryptoTableView)
        // Aplicar constraints
        self.cryptoTableView.pinToBorders(with: view)
        // Designar delegate y data source del table view
        self.cryptoTableView.delegate = self
        self.cryptoTableView.dataSource = self
        // EL .self despues del nombre de la clase, hace que pasemos como parametro el nombre de la clase
        self.cryptoTableView.register(ReusableTableViewCell.self, forCellReuseIdentifier: ReusableTableViewCell.reuseIdentifier)
    }
    
}

extension CryptoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Creamos siguiente vista
        let nextView: ExchangeRateViewController = ExchangeRateViewController()
        // Pasamos info de la crypto que vamos a mostrar
        nextView.cryptoSelected = availableCrypto[indexPath.row]
        // transicionamos
        navigationController?.pushViewController(nextView, animated: true)
        // Deseleccionamos la celda
        tableView.deselectRow(at: indexPath, animated: true)
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
        guard let cell: ReusableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reuseIdentifier, for: indexPath) as? ReusableTableViewCell else { return UITableViewCell() }
        
        let currency: Crypto = availableCrypto[indexPath.row]
        
        cell.initUI(model: currency)
        return cell
    }
}
