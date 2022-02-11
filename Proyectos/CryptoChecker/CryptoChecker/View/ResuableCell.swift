//
//  CurrencyListTableViewCell.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

//MARK: - class CurrencyListTableViewCell
class ReusableTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String = "CurrencyListTableViewCell"
    
    //MARK: Labels
    var nameLabel: UILabel?
    var minSizeLabel: UILabel?
    
    
    func initUI(model: TableViewCellVieable) {
        
    }
    override func prepareForReuse() {
        
    }
}
