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
            if let view = Bundle.main.loadNibNamed(String(describing: IDAddFlashcardFooterView.self), owner: nil, options: nil)!.last {
                Holder.height = (view as! UIView).frame.size.height
            }
        }
        return Holder.height
    }
    
    // MARK: Action
    
    @IBAction func didTapAddImageButton(_ sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addFlashcardFooterViewDidTapAddImageButton(self)
        }
    }
    
    @IBAction func didTapAddTextButton(_ sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addFlashcardFooterViewDidTapAddTextButton(self)
        }
    }
    
    @IBAction func didTapLeftButton(_ sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addFlashcardFooterViewDidTapLeftButton(self)
        }
    }
    
    @IBAction func didTapRightButton(_ sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.addFlashcardFooterViewDidTapRightButton(self)
        }
    }
    
}
