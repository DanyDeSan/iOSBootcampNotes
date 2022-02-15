//
//  RateView.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 15/02/22.
//

import UIKit

class RateView: UIView {
    var titleLabel: UILabel?
    var valueLabel: UILabel?
    var currencyLabel: UILabel?
    
    func initUI(model: RateViewable) {
        
        titleLabel = UILabel()
        valueLabel = UILabel()
        currencyLabel = UILabel()
        
        titleLabel?.text = model.title
        valueLabel?.text = model.value
        
        self.addSubview(titleLabel!)
        self.addSubview(valueLabel!)
        
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        valueLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        valueLabel?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        valueLabel?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        titleLabel?.applyRedStyle()
        valueLabel?.applyGreenStyle()
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
        backgroundColor = UIColor.softGray
    }
    
}
