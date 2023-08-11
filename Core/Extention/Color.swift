//
//  Color.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 13/5/2564 BE.
//

import UIKit

public extension UIColor {
    
    enum BaseColorScheme {
        case darkBlue
        case blue
        case green
        case yellow
        case red
        case textLightGray
        case textGray
        case main
        case darkMain
        case grayBackground
        case pending
        case delivery
        case success
    }
    
    static func asset(_ colorScheme: BaseColorScheme) -> UIColor {
        switch colorScheme {
        case .darkBlue:
            return UIColor(hexString: "#173F5F")!
        case .blue:
            return UIColor(hexString: "#20639B")!
        case .green:
            return UIColor(hexString: "#3CAEA3")!
        case .yellow:
            return UIColor(hexString: "#F6D55C")!
        case .red:
            return UIColor(hexString: "#ED553B")!
        case .textLightGray:
            return UIColor(hexString: "#AAAAAA")!
        case .textGray:
            return UIColor(hexString: "#666666")!
        case .main:
            return UIColor(hexString: "#00B6B2")!
        case .darkMain:
            return UIColor(hexString: "#00B6A3")!
        case .grayBackground:
            return UIColor(hexString: "#F8F8F8")!
        case .pending:
            return UIColor(hexString: "#36B2FF")!
        case .delivery:
            return UIColor(hexString: "#FF7F50")!
        case .success:
            return UIColor(hexString: "#89B445")!
        }
    }
}

public extension UIColor {
    convenience init?(hexString: String) {
        
        if hexString.hasPrefix("#") {
            var hexColor: String = hexString.replacingOccurrences(of: "#", with: "")
            if hexColor.count == 6 {
                hexColor = "\(hexColor)FF"
            }
            
            if hexColor.count == 8 {
                let scanner: Scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    let red: UInt64 = ((hexNumber & 0xff000000) >> 24)
                    let green: UInt64 = ((hexNumber & 0x00ff0000) >> 16)
                    let blue: UInt64 = ((hexNumber & 0x0000ff00) >> 8)
                    let alpha: UInt64 = (hexNumber & 0x000000ff)
                    
                    self.init(
                        red: CGFloat(red) / 255.0,
                        green: CGFloat(green) / 255.0,
                        blue: CGFloat(blue) / 255.0,
                        alpha: CGFloat(alpha) / 255.0)
                    
                    return
                }
            }
        }
        
        return nil
    }
}
