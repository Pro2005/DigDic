//
//  IDLDBWord.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class LDBFlashcard: Object, Flashcard {
    var frontCard: Card? {
        get {
            return self._frontCard as? Card
        }
        set {
            self._frontCard = newValue as? LDBCard
        }
    }
    
    var backCard: Card? {
        get {
            return self._backCard as? Card
        }
        set {
            self._backCard = newValue as? LDBCard
        }
    }
    
    fileprivate dynamic var _frontCard: LDBCard?
    fileprivate dynamic var _backCard: LDBCard?
    
    override static func ignoredProperties() -> [String] {
        return ["frontCard", "backCard"]
    }
}
