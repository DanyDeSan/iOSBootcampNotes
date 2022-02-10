//
//  SecondViewController.swift
//  Delegate
//
//  Created by L Daniel De San Pedro on 08/02/22.
//

import UIKit

class SecondViewController: UIViewController {
    // Usando protocol binding
    weak var delegate: SecondViewDelegate?
    
    @IBOutlet weak var messageTextField: UITextField?
    
    @IBAction func onPushButton(_ sender: UIButton) {
        delegate?.receiveMessage(messageTextField?.text ?? "")
        delegate?.receiveArray(["Dany","Saul","Jonny"])
        self.dismiss(animated: true, completion: nil)
    }
}
