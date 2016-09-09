//
//  IDDictionaryProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionary {
    var name: String? {get}
    var flashcards: [IDFlashcard] {get}
    
    func addFlashcard(flashcard: IDFlashcard)
    func removeFlashcard(flashcard: IDFlashcard)
}