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
    var subtitleLabel: UILabel?
    
    
    func initUI(model: TableViewCellVieable) {
        //Agregar los labels a las views
        self.nameLabel = UILabel()
        self.subtitleLabel = UILabel()
        contentView.addSubview(nameLabel!)
        contentView.addSubview(subtitleLabel!)
        
        //Agregar contenido
        self.nameLabel?.text = model.title
        self.subtitleLabel?.text = model.subtitle
        
        //Configurar constraints
        self.nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIView.padding).isActive = true
        self.nameLabel?.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UIView.padding).isActive = true
        
        self.subtitleLabel?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIView.padding).isActive = true
        self.subtitleLabel?.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: UIView.padding).isActive = true
        
        self.nameLabel?.applyGreenStyle()
        self.subtitleLabel?.applyRedStyle()
        
    }
    override func prepareForReuse() {
        self.nameLabel?.removeFromSuperview()
        self.subtitleLabel?.removeFromSuperview()
        self.nameLabel = nil
        self.subtitleLabel = nil
    }
}
