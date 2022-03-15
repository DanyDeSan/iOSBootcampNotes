//
//  BlurFilter.swift
//  ImageDecorator
//
//  Created by L Daniel De San Pedro on 14/03/22.
//

import Foundation

class BlurFilter: BaseFilter {
    
    required init(_ editor: ImageEditor) {
        super.init(editor: editor, filterName: "CIGaussianBlur")
    }
    
    func update(radius: Double) {
        filter?.setValue(radius, forKey: "inputRadius")
    }
    
    override var description: String {
        return "Blur Filter"
    }
}
