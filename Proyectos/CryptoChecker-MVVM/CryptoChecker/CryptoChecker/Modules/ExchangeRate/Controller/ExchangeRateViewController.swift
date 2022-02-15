//
//  ExchangeRateViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    
    private var viewModel: ExchangeViewModel = ExchangeViewModel()
        
    lazy var exchangesTableView: UITableView = UITableView()
    
    lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    lazy var errorLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.applyBackgroundColor()
        title = viewModel.obtainViewTitle()
        initViewModel()
        viewModel.requestInfo()
    }
    
    func initViewModel() {
        viewModel.fetchingData.valueChanged = { [weak self] isFetchig in
            if isFetchig ?? false {
                self?.initActivityView()
            } else {
                self?.removeActivityView()
            }
        }
        viewModel.exchangeData.valueChanged = { [weak self] _ in
            self?.initUI()
        }
        viewModel.didObtainError.valueChanged = { [weak self] errorState in
            errorState ?? false ? self?.showErrorLabel() : self?.hideErrorLabel()
        }
        viewModel.route.valueChanged = {[weak self] route in
            guard let nextView: UIViewController = route?.viewController else { return }
            self?.navigationController?.pushViewController(nextView, animated: true)
        }
    }
    
    func showErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.text = Constants.errorlabel
        errorLabel.centerInView(with: view)
    }
    
    func hideErrorLabel() {
        errorLabel.removeFromSuperview()
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
    
    func setViewModel(_ viewModel: ExchangeViewModel) {
        self.viewModel = viewModel
    }
}

extension ExchangeRateViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(index: indexPath.row)
    }
}

extension ExchangeRateViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height * 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.obtainNumberOfResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewCell: ReusableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ReusableTableViewCell.reuseIdentifier, for: indexPath) as? ReusableTableViewCell else {
                  return UITableViewCell()
              }
        let exchange: ExchangeRateModel = viewModel.obtainModelAtIndex(index: indexPath.row)
        viewCell.initUI(model: exchange)
        return viewCell
    }
}
