//
//  Observable.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 14/02/22.
//

import Foundation

class Observable<ObservedType> {
    // En esta variable guardamos el valor
    private var _value: ObservedType?
    // En esta variable computable detectamos cuando recibimos un
    // nuevo valor y accionamos el closure
    // Y tambien nos sirve para consultar el valor que previamente habíamos
    // obtenido
    var value: ObservedType? {
        get {
            return _value
        }
        set {
            // NewValue es una variable que ya viene definida
            // que contiene el valor nuevo que vamos a asignar
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
