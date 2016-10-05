//
//  IDAddFlashcardFooterViewDelegate.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/30/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddFlashcardFooterViewDelegate {
    
    func addFlashcardFooterViewDidTapAddImageButton(_ footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapAddTextButton(_ footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapLeftButton(_ footerView: IDAddFlashcardFooterView)
    func addFlashcardFooterViewDidTapRightButton(_ footerView: IDAddFlashcardFooterView)
    
}
