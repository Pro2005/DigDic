//
//  IDAddFlashcardFooterView.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardFooterView: UIView {
    
    var delegate: IDAddFlashcardFooterViewDelegate?
    
    // MARK: Public
    
    class func height() -> CGFloat {
        struct Holder {
            static var height: CGFloat = 0
        }
        if Holder.height == 0 {
            if let view = NSBundle.mainBundle().loadNibNamed(String(IDAddFlashcardFooterView), owner: nil, options: nil).last {
                Holder.height = (view as! UIView).frame.size.height
            }
        }
        return Holder.height
    }
    
    // MARK: Action
    
    @IBAction func didTapAddImageButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.AddFlashcardFooterViewDidTapAddImageButton(self)
        }
    }
    
    @IBAction func didTapLeftButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.AddFlashcardFooterViewDidTapLeftButton(self)
        }
    }
    
    @IBAction func didTapRightButton(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.AddFlashcardFooterViewDidTapRightButton(self)
        }
    }
    
}