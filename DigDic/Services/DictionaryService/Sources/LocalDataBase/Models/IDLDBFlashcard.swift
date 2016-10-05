//
//  IDLDBWord.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBFlashcard: Object, IDFlashcard {
    var frontCard: IDCard? {
        get {
            return self._frontCard as? IDCard
        }
        set {
            self._frontCard = newValue as? IDLDBCard
        }
    }
    
    var backCard: IDCard? {
        get {
            return self._backCard as? IDCard
        }
        set {
            self._backCard = newValue as? IDLDBCard
        }
    }
    
    fileprivate dynamic var _frontCard: IDLDBCard?
    fileprivate dynamic var _backCard: IDLDBCard?
    
    override static func ignoredProperties() -> [String] {
        return ["frontCard", "backCard"]
    }
}
