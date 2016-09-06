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
    var cards: [IDFlashcard] {
        return self._cards.map{$0 as IDFlashcard}
    }
    
    func addCard(card: IDFlashcard) {
        guard let card = card as? IDLDBFlashcard else {
            return
        }
        self._cards.append(card)
    }
    
    // MARK: Private
    private let _cards = List<IDLDBFlashcard>()
    
    override static func ignoredProperties() -> [String] {
        return ["cards"]
    }
}