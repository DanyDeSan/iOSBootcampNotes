//
//  BaseFilter.swift
//  ImageDecorator
//
//  Created by L Daniel De San Pedro on 14/03/22.
//

import Foundation
import CoreImage
import UIKit

class BaseFilter: ImageDecorator {
    var filter: CIFilter?
    
    init(editor: ImageEditor, filterName: String) {
        self.filter = CIFilter(name: filterName)
        super.init(editor)
    }
    
    override func apply() -> UIImage {
        
        let image = super.apply()
        let context = CIContext(options: nil)
        
        filter?.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        guard let output = filter?.outputImage,
              let coreImage = context.createCGImage(output, from: output.extent) else {
                  return image
              }
        return UIImage(cgImage: coreImage)
    }
    
    override var description: String {
        return "Base Filter"
    }
}
