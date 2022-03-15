//
//  ViewController.swift
//  ImageDecorator
//
//  Created by L Daniel De San Pedro on 13/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView?
    private var filterLessImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        filterLessImage = loadImage()
        image?.image = filterLessImage
    }
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            applyBlurEffect()
        case 1:
            applyColorEffect()
        default:
            return 
        }
    }
    
    func applyBlurEffect() {
        guard let image = filterLessImage else {
            return
        }
        let blurFilter = BlurFilter(image)
        blurFilter.update(radius: 10)
        self.image?.image = blurFilter.apply()
    }
    
    func applyColorEffect() {
        guard let image = filterLessImage else {
            return
        }
        let colorFilter = ColorFilter(image)
        colorFilter.update(contrast: 0.53)
        colorFilter.update(brightness: 0.12)
        colorFilter.update(saturation: 4)
        self.image?.image = colorFilter.apply()
    }
    
    private func loadImage() -> UIImage {
        let urlString = "https://refactoring.guru/images/content-public/logos/logo-new-3x.png"
        
        guard let url = URL(string: urlString) else {
            fatalError("Please enter a valid URL")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cannot load an image")
        }

        guard let image = UIImage(data: data) else {
            fatalError("Cannot create an image from data")
        }
        return image
    }
}

