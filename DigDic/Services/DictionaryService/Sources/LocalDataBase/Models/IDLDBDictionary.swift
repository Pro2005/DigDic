//
//  IDLDBDictionary.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBDictionary: Object, IDDictionary {
    // MARK: IDDictionaryProtocol
    dynamic var name: String?
    var flashcards: [IDFlashcard] {
        return self._flashcards.map{$0 as IDFlashcard}
    }

    func addFlashcard(_ flashcard: IDFlashcard) {
        guard let flashcard = flashcard as? IDLDBFlashcard else {
            return
        }
        self._flashcards.append(flashcard)
    }
    
    func removeFlashcard(_ flashcard: IDFlashcard) {
        guard let flashcard = flashcard as? IDLDBFlashcard else {
            return
        }
        if let index = self._flashcards.index(of: flashcard) {
            self._flashcards.remove(at: index)
        }
    }
    
    // MARK: Private
    fileprivate var _flashcards = List<IDLDBFlashcard>()
    
    override static func ignoredProperties() -> [String] {
        return ["flashcards"]
    }
}
