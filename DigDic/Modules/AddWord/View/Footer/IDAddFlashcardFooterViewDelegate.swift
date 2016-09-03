//
//  IDAddFlashcardFooterViewDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddFlashcardFooterViewDelegate {
    
    func AddFlashcardFooterViewDidTapAddImageButton(footerView: IDAddFlashcardFooterView)
    func AddFlashcardFooterViewDidTapLeftButton(footerView: IDAddFlashcardFooterView)
    func AddFlashcardFooterViewDidTapRightButton(footerView: IDAddFlashcardFooterView)
    
}