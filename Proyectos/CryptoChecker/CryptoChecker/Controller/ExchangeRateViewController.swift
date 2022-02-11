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
        view.backgroundColor = .white
        title = cryptoSelected?.abbreviation ?? "BTC"
        requestInfo()
    }
    
    func requestInfo() {
        initActivityView()
        apiDataManager = APIDataManager<ExchangeRateURLResponse>(endpoint: .exchange(currency: cryptoSelected?.abbreviation ?? "BTC"))
        apiDataManager?.performRequest(completion: { [weak self] response in
            self?.exchangeData = ExchangeRateModel.createFromResponseModel(response.data)
            self?.removeActivityView()
            self?.initUI()
            
        }, onError: {[weak self] error  in
            print(error)
            self?.removeActivityView()
        })
    }
    
    func initActivityView() {
        view.addSubview(activityIndicator)
        activityIndicator.pinToBorders(with: view)
        activityIndicator.startAnimating()
    }
    
    func removeActivityView() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    func initUI() {
        view.addSubview(exchangesTableView)
        exchangesTableView.pinToBorders(with: view)
        exchangesTableView.register(ReusableTableViewCell.self, forCellReuseIdentifier: ReusableTableViewCell.reuseIdentifier)
        exchangesTableView.delegate = self
        exchangesTableView.dataSource = self
        
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
        return exchangeData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewCell: ReusableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reuseIdentifier, for: indexPath) as? ReusableTableViewCell,
              let exchangeRate: ExchangeRateModel = exchangeData?[indexPath.row] else {
            return UITableViewCell()
        }

        viewCell.initUI(model: exchangeRate)
        return viewCell
    }
}
