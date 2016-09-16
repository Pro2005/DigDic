//
//  IDAddFlashcardFooterViewDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddFlashcardFooterViewDelegate {
    
    func addFlashcardFooterViewDidTapAddImageButton(footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapAddTextButton(footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapLeftButton(footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapRightButton(footerView: IDAddFlashcardFooterView)
    
}