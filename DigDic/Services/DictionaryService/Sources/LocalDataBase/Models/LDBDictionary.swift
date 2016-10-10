//
//  IDLDBDictionary.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class LDBDictionary: Object, Dictionary {
    // MARK: IDDictionaryProtocol
    dynamic var name: String?
    var flashcards: [Flashcard] {
        return self._flashcards.map{$0 as Flashcard}
    }

    func addFlashcard(_ flashcard: Flashcard) {
        guard let flashcard = flashcard as? LDBFlashcard else {
            return
        }
        self._flashcards.append(flashcard)
    }
    
    func removeFlashcard(_ flashcard: Flashcard) {
        guard let flashcard = flashcard as? LDBFlashcard else {
            return
        }
        if let index = self._flashcards.index(of: flashcard) {
            self._flashcards.remove(at: index)
        }
    }
    
    // MARK: Private
    fileprivate var _flashcards = List<LDBFlashcard>()
    
    override static func ignoredProperties() -> [String] {
        return ["flashcards"]
    }
}
