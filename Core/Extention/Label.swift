//
//  Label.swift
//  Core
//
//  Created by Tanakorn Phoochaliaw on 19/5/2564 BE.
//

import UIKit

public extension UILabel {
    func custom(_ fontStyle: UIFont = .asset(.bold, fontSize: .head1), _ color: UIColor = .asset(.textGray)) {
        font = fontStyle
        textColor = color
    }
}
