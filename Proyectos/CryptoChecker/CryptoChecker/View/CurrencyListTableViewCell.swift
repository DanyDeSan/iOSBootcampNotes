//
//  CurrencyListTableViewCell.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

//MARK: - class CurrencyListTableViewCell
class CurrencyListTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String = "CurrencyListTableViewCell"
    
    //MARK: Labels
    var nameLabel: UILabel?
    var minSizeLabel: UILabel?
    
    
    func initUI(model: TableViewCellVieable) {
        //Create labels
        
        self.nameLabel = UILabel()
        self.minSizeLabel = UILabel()
        // Add labels to view
        contentView.addSubview(nameLabel!)
        contentView.addSubview(minSizeLabel!)
        //Prepare labels for constraints
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        minSizeLabel?.translatesAutoresizingMaskIntoConstraints = false
        //Add Constraints
        nameLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: UIView.padding).isActive = true
        nameLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIView.padding).isActive = true
        
        minSizeLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: UIView.padding).isActive = true
        minSizeLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -UIView.padding).isActive = true
        //Set Content of labels
        nameLabel?.text = model.title
        minSizeLabel?.text = model.subTitle
        //Configure labels
        nameLabel?.applyNameCurrencyLabel()
        minSizeLabel?.applyMinSizeCurrencyLabel()
    }
    override func prepareForReuse() {
        nameLabel?.removeFromSuperview()
        minSizeLabel?.removeFromSuperview()
        nameLabel = nil
        minSizeLabel = nil
    }
}
