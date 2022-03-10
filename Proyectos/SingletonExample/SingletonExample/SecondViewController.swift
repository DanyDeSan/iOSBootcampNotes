//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by L Daniel De San Pedro on 09/03/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackgroundColorManager.sharedInstance.backgroundColor
    }
    
    @IBAction func goNext() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let thirdView: ThirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        self.navigationController?.pushViewController(thirdView, animated: true)
    }
}
