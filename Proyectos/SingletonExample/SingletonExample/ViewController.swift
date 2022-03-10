//
//  ViewController.swift
//  SingletonExample
//
//  Created by L Daniel De San Pedro on 09/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func redButtonPressed() {
        BackgroundColorManager.sharedInstance.backgroundColor = UIColor.red
    }
    
    @IBAction func blueButtonPressed() {
        BackgroundColorManager.sharedInstance.backgroundColor = UIColor.blue
    }

    @IBAction func goNext() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondView: SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        self.navigationController?.pushViewController(secondView, animated: true)
    }
}

