//
//  ImageEditable.swift
//  ImageDecorator
//
//  Created by L Daniel De San Pedro on 14/03/22.
//

import Foundation
import UIKit

protocol ImageEditor: CustomStringConvertible {
    func apply() -> UIImage
}
