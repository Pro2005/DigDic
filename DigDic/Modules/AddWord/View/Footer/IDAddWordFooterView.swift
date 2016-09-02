//
//  IDAddWordFooterView.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddWordFooterView: UIView {
    
    var delegate: IDAddWordFooterViewDelegate?
    
    // MARK: Public
    
    class func height() -> CGFloat {
        struct Holder {
            static var height: CGFloat = 0
        }
        if Holder.height == 0 {
            if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddWordFooterView), owner: nil, options: nil).last {
                Holder.height = (view as! UIView).frame.size.height
            }
        }
        return Holder.height
    }
    
    // MARK: Action
    
    @IBAction func didTapAddImageButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addWordFooterViewDidTapAddImageButton(self)
        }
    }
    
    @IBAction func didTapLeftButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addWordFooterViewDidTapLeftButton(self)
        }
    }
    
    @IBAction func didTapRightButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addWordFooterViewDidTapRightButton(self)
        }
    }
    
}