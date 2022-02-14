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
    
    lazy var apiDataManager: APIDataManager<CurrencyListResponse> = APIDataManager<CurrencyListResponse>(endpoint: .currencies)
    
    private lazy var viewModel: CryptoViewModelProtocol = CryptoViewModel(localDataManager: CryptoViewLocalDataManager())
    private var availableCrypto: [Crypto] = [Crypto]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initViewModel()
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
    
    func initViewModel() {
        viewModel.cryptoDataSource.valueChanged = { [weak self] cryptoDataSource in
            self?.availableCrypto = cryptoDataSource ?? []
            self?.cryptoTableView.reloadData()
        }
        viewModel.obtainAvailableCryptos()
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
