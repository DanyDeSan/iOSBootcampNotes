//
//  UIColor++.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation
import UIKit

extension UIColor {
    static var greenCurrency: UIColor = UIColor(hex: 0x337357, alpha: 1)
    static var redCurrency: UIColor = UIColor(hex: 0xE83151, alpha: 1)
    static var softGray: UIColor = UIColor(hex: 0xE4E4E2, alpha: 1)
    
    convenience init(hex: Int, alpha: CGFloat) {
        let red: Int = (hex >> 16) & 0xFF
        let green: Int = (hex >> 8) & 0xFF
        let blue: Int = hex & 0xFF
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
}
