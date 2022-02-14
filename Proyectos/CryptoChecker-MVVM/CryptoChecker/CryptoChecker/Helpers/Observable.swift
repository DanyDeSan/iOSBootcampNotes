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
    
    // With this closure we inform the View that the value has changed
    var valueChanged: ((ObservedType?) -> ())?
    
    init(_ value: ObservedType) {
        _value = value
    }
    
    // With this function we inform the ViewModel that the value changed
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is \(newValue)")
    }
}
