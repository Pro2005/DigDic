//
//  IDDictionaryProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol Dictionary {
    var name: String? {get}
    var flashcards: [Flashcard] {get}
    
    func addFlashcard(_ flashcard: Flashcard)
    func removeFlashcard(_ flashcard: Flashcard)
}
