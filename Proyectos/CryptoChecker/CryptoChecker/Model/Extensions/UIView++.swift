//
//  UIView++.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

extension UIView {
    
    func pinToBorders(with view: UIView) {
        // Siempre poner esta linea antes de establecer constains
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    static var padding: CGFloat = 10
    
    func applyBackgroundColor() {
        self.backgroundColor = .white
    }
}
