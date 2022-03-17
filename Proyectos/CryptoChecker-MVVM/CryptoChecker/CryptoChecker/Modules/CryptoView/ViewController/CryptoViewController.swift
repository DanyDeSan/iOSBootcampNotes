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
    
    var viewModel: CryptoViewModelProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initViewModel()
    }
    
    func set(viewModel: CryptoViewModelProtocol) {
        self.viewModel = viewModel
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
        // Add item button
        let barButton: UIBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { action in
            self.tabButtonPushed()
        }), menu: nil)
        self.navigationItem.setRightBarButton(barButton, animated: true)
    }
    
    func initViewModel() {
        viewModel?.cryptoDataSource.valueChanged = { [weak self] cryptoDataSource in
            self?.cryptoTableView.reloadData()
        }
        viewModel?.obtainAvailableCryptos()
        
        viewModel?.route.valueChanged = { [weak self] optionalRouter in
            guard let self = self,
                  let route: Route = optionalRouter,
                  let nextViewController = route.viewController else { return }
            // In case that the next view is a whole view controller
            if case Route.exchangeView(crypto: _) = route {
                self.navigationController?.pushViewController(nextViewController, animated: true)
            } else { // In case that the next view is a alert
                self.present(nextViewController, animated: true, completion: nil)
            }
        }
    }
    
    private func tabButtonPushed() {
        viewModel?.didTappedBarButton()
    }
}

extension CryptoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectCell(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CryptoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.obtainNumberOfAvailableCryptos() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ReusableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reuseIdentifier, for: indexPath) as? ReusableTableViewCell else { return UITableViewCell() }
        
        let currency: Crypto = viewModel?.obtainCrypto(at: indexPath.row) ?? Crypto(name: "", abbreviation: "")
        
        cell.initUI(model: currency)
        return cell
    }
}
