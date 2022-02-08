//
//  ViewController.swift
//  Delegate
//
//  Created by L Daniel De San Pedro on 08/02/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPushButton(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view: SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
                as? SecondViewController else { return }
        self.present(view, animated: true, completion: nil)
    }

}

