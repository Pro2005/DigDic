
//
//  IDAddFlashcardTextCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 16.09.16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardTextCell: UITableViewCell, IDAddFlashcardCell, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    var delegate: IDAddFlashcardTextCellDelegate?
    
    func loadFromDataHolder(_ dataHolder: IDAddFlashcardDataHolder) {
        guard let dataHolder = dataHolder as? IDAddFlashcardTextDataHolder else {
            return
        }
        if let text = dataHolder.text {
            self.textView.text = text
        }
    }
    
    // MARK: UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string = (textView.text as NSString).replacingCharacters(in: range, with: text)
        if let delegate = self.delegate {
            delegate.textCell(self, didChangeText: string)
        }
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // MARK: Override
    
    override func prepareForReuse() {
        self.textView.text = ""
    }
    
//    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    
//    NSString * searchString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    
//    if ([self.delegate respondsToSelector:@selector(searchBar:wantsToSearchText:)]) {
//    [self.delegate searchBar:self wantsToSearchText:searchString];
//    }
//    
//    return YES;
//    }
    
}
