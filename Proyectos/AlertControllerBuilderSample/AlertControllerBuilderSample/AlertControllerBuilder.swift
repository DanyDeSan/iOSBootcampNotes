//
//  AlertControllerBuilder.swift
//  AlertControllerBuilderSample
//
//  Created by L Daniel De San Pedro on 10/03/22.
//

import Foundation
import UIKit

final class AlertControllerBuilder {
    
    private var alertView: UIAlertController
    
    init() {
        alertView = UIAlertController(title: String(), message: String(), preferredStyle: .alert)
    }
    
    
    func set(title: String) -> AlertControllerBuilder {
        alertView.title = title
        return self
    }
    
    func set(message: String) -> AlertControllerBuilder {
        alertView.message = message
        return self
    }
    
    func add(action: UIAlertAction) -> AlertControllerBuilder {
        alertView.addAction(action)
        return self
    }
    
    func obtainAlert() -> UIAlertController {
        let buildedAlertView: UIAlertController = self.alertView
        self.alertView = UIAlertController(title: "", message: "", preferredStyle: .alert)
        return buildedAlertView
    }
}
