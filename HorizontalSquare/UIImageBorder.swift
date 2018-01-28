//
//  UIImageBorder.swift
//  HorizontalSquare
//
//  Created by Hayden Williams on 1/24/18.
//  Copyright © 2018 Hayden Williams. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
    func addBorderToImage() -> UIImage? {
       
        /* the size of the finished photo. The aspect of the photo is a square
         * using the original width of the photo as the height */
        
        let width = self.size.width // original width of photo
        let height = self.size.height // original height of photo
        
        let newHeight = width // the new height of the photo is the original width
        let heightDifference = (width - height) / 2
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: newHeight), false, 0)
        let origin: CGPoint =  CGPoint(x: 0, y: heightDifference)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageWithPadding
        
    }
    
}
