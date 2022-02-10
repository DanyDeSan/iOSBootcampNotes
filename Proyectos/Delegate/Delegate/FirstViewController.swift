//
//  ViewController.swift
//  Delegate
//
//  Created by L Daniel De San Pedro on 08/02/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel?
    
    var arrayStrings: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onPushButton(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view: SecondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
                as? SecondViewController else { return }
        view.delegate = self
        self.present(view, animated: true, completion: nil)
    }

}

extension FirstViewController: SecondViewDelegate {
    func receiveMessage(_ message: String) {
        self.messageLabel?.text = message
    }
    func receiveArray(_ arrayString: [String]) {
        self.arrayStrings = arrayString
    }
}
