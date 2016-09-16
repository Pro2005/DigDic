
//
//  IDAddFlashcardTextCell.swift
//  DigDic
//
//  Created by Ilya Denisov on 16.09.16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

class IDAddFlashcardTextCell: UITableViewCell, IDAddFlashcardCell {
    @IBOutlet weak var textView: UITextView!
    
    func loadFromDataHolder(dataHolder: IDAddFlashcardDataHolder) {
        guard let dataHolder = dataHolder as? IDAddFlashcardTextDataHolder else {
            return
        }
        if let text = dataHolder.text {
            self.textView.text = text
        }
    }
    
    // MARK: Override
    
    override func prepareForReuse() {
        self.textView.text = ""
    }
    
}