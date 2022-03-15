//
//  ImageDecorator.swift
//  ImageDecorator
//
//  Created by L Daniel De San Pedro on 14/03/22.
//

import Foundation
import UIKit

class ImageDecorator: ImageEditor {
    
    private var imageEditor: ImageEditor
    
    init(_ editor: ImageEditor) {
        self.imageEditor = editor
    }
    
    func apply() -> UIImage {
        return imageEditor.apply()
    }
    
    var description: String {
        return "ImageDecorator"
    }
}
