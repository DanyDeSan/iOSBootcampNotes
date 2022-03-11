//
//  ViewController.swift
//  AlertControllerBuilderSample
//
//  Created by L Daniel De San Pedro on 10/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var alertBuilder: AlertControllerBuilder = AlertControllerBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        switch sender.tag {
        case 0: displaySimpleAlert()
        case 1: displayTwoButtonAlert()
        case 2: displayThreeButtonAlert()
        default: return
        }
    }
    
    
    private func displaySimpleAlert() {
        let alertController: UIAlertController = alertBuilder.set(title: "Simple Alert")
            .set(message: "Simple message")
            .add(action: UIAlertAction(title: "Action", style: .default, handler: nil))
            .obtainAlert()
        present(alertController, animated: true, completion: nil)
    }
    
    private func displayTwoButtonAlert() {
        let alertController: UIAlertController = alertBuilder.set(title: "Simple Alert")
            .set(message: "Simple message")
            .add(action: UIAlertAction(title: "Action", style: .default, handler: nil))
            .add(action: UIAlertAction(title: "Second Action", style: .cancel, handler: nil))
            .obtainAlert()
        present(alertController, animated: true, completion: nil)
    }
    
    private func displayThreeButtonAlert() {
        let alertController: UIAlertController = alertBuilder.set(title: "Simple alert")
            .set(message: "Simple message")
            .add(action: UIAlertAction(title: "Action", style: .default, handler: nil))
            .add(action: UIAlertAction(title: "Second Action", style: .cancel, handler: nil))
            .add(action: UIAlertAction(title: "Third Action", style: .destructive, handler: nil))
            .obtainAlert()
        present(alertController, animated: true, completion: nil)
    }
}

