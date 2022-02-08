//
//  SecondViewController.swift
//  Delegate
//
//  Created by L Daniel De San Pedro on 08/02/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var messageTextField: UITextField?
    
    @IBAction func onPushButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
