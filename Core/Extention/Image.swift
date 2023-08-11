//
//  Image.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 17/3/2566 BE.
//

import UIKit

public extension UIImageView {
    func circle(color: UIColor = .clear) {
        layer.cornerRadius = frame.size.height * 0.5
        clipsToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = color.cgColor
    }
}

public extension UIImage {
    struct Asset {
        public static let avatar = UIImage(named: "avatar", in: ConfigBundle.core, compatibleWith: nil)!
        public static let avatarNavbar = UIImage(named: "avatar-navbar", in: ConfigBundle.core, compatibleWith: nil)!
    }
    
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        if size.width < targetSize.width || size.height < targetSize.height {
            return self
        }

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func imageFromColor(color: UIColor, width: CGFloat = 1.0, height: CGFloat = 1.0) -> UIImage? {
        var image: UIImage?
        let rect = CGRect(x: 0.0, y: 0.0, width: width, height: height)
        UIGraphicsBeginImageContext(rect.size)
        
        if let context: CGContext = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        return image
    }
}
