//
//  BuySellViewController.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 15/02/22.
//

import UIKit

class BuySellViewController: UIViewController {
    
    var viewModel: BuySellViewModel = BuySellViewModel()
    lazy var sellInfoView: RateView = RateView()
    lazy var buyInfoView: RateView = RateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initViewModel()
        
        self.view.applyBackgroundColor()
        viewModel.fetchData()

    }
    
    func initViewModel() {
        viewModel.buyDataObserver.valueChanged = { [weak self] buyData in
            guard let model: SellBuyModel = buyData else { return }
            self?.buyInfoView.initUI(model: model)
        }
        
        viewModel.sellDataObserver.valueChanged = { [weak self] sellData in
            guard let model: SellBuyModel = sellData else { return }
            self?.sellInfoView.initUI(model: model)
        }
    }
    
    func initUI() {
        self.title = viewModel.obtainViewTitle()
        
        view.addSubview(sellInfoView)
        view.addSubview(buyInfoView)
        
        sellInfoView.translatesAutoresizingMaskIntoConstraints = false
        buyInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        sellInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: UIView.padding).isActive = true
        sellInfoView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: UIView.padding).isActive = true
        sellInfoView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -UIView.padding).isActive = true
        sellInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        buyInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -UIView.padding).isActive = true
        buyInfoView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIView.padding).isActive = true
        buyInfoView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -UIView.padding).isActive = true
        buyInfoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
}
