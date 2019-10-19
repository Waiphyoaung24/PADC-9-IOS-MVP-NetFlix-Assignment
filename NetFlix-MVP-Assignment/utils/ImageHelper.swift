//
//  ImageHelper.swift
//  NetFlix-MVP-Assignment
//
//  Created by Waiphyoag on 10/17/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    
    static func blurImage(usingImage image: UIImage, blurAmout: CGFloat) -> UIImage? {
        
        guard let ciImage = CIImage(image: image) else {
            return nil
        }
        
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(blurAmout, forKey: kCIInputRadiusKey)
        
        guard let outputImage = blurFilter?.outputImage else {
            return nil
        }
        
        return UIImage(ciImage: outputImage)
    }
}
