//
//  IDDictionaryDetailIDDictionaryDetailInteractorInput.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionaryDetailInteractorInput: BaseInteractorInput {
    
    func removeFlashcard(_ flashcard: Flashcard, fromDictinary dictionary: Dictionary)
    
}
