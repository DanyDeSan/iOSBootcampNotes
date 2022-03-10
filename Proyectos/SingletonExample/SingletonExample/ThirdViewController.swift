//
//  ThirdViewController.swift
//  SingletonExample
//
//  Created by L Daniel De San Pedro on 09/03/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackgroundColorManager.sharedInstance.backgroundColor
    }

}
