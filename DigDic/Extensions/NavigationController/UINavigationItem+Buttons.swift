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
    case Left
    case Right
}

extension UINavigationItem {
    
    func addButtonWithTitle(title: String, alignment: UIBarButtonItemAlignment, font: UIFont, titleColor: UIColor = UIColor.blackColor()) -> UIButton {
        let button = self._buttonWithTitle(title, font: font, titleColor: titleColor)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        switch alignment {
        case .Left:
            self.leftBarButtonItem = barButtonItem
        case .Right:
            self.rightBarButtonItem = barButtonItem
        }
        return button
    }
    
    // MARK: - Private
    private func _buttonWithTitle(title: String, font: UIFont, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .Custom)
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, forState: .Normal)
        button.sizeToFit()
        return button
    }
    
}