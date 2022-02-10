//
//  SecondViewControllerDelegate.swift
//  Delegate
//
//  Created by L Daniel De San Pedro on 09/02/22.
//

import Foundation

// Con AnyObject limito a que solo las clases adopten el protocolo
protocol SecondViewDelegate: AnyObject {
    func receiveMessage(_ message: String)
    func receiveArray(_ arrayString: [String])
}

