//
//  UINavigationItem+Buttons.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/22/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

enum UIBarButtonItemAlignment: Int {
    case left
    case right
}

extension UINavigationItem {
    
    func addButtonWithTitle(_ title: String, alignment: UIBarButtonItemAlignment, font: UIFont, titleColor: UIColor = UIColor.black) -> UIButton {
        let button = self._buttonWithTitle(title, font: font, titleColor: titleColor)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        switch alignment {
        case .left:
            self.leftBarButtonItem = barButtonItem
        case .right:
            self.rightBarButtonItem = barButtonItem
        }
        return button
    }
    
    // MARK: - Private
    fileprivate func _buttonWithTitle(_ title: String, font: UIFont, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: UIControlState())
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, for: UIControlState())
        button.sizeToFit()
        return button
    }
    
}
