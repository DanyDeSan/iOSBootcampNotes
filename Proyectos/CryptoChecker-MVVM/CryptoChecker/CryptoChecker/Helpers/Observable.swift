//
//  Observable.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation

class Observable<ObservedType> {
    private var _value: ObservedType?
    var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    var valueChanged: ((ObservedType?) -> ())?
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is \(newValue)")
    }
}
