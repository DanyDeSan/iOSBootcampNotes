//
//  BackgroundColorManager.swift
//  SingletonExample
//
//  Created by L Daniel De San Pedro on 09/03/22.
//

import Foundation
import UIKit

class BackgroundColorManager {
    
    static var sharedInstance: BackgroundColorManager = BackgroundColorManager()
    
    private init() {}
    
    var backgroundColor: UIColor = UIColor.white
    
}
