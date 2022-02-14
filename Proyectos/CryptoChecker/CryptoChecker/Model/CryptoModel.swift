//
//  CryptoModel.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import Foundation

struct Crypto {
    var name: String
    var abbreviation: String
}

extension Crypto: TableViewCellVieable {
    var title: String {
        return name
    }
    var subtitle: String {
        return abbreviation
    }
}
