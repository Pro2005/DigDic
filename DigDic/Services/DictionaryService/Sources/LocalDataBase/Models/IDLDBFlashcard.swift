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
    var data: [IDFlashcardData]? {
        get {
            return self._data.map{$0 as IDFlashcardData}
        }
        set {
            if let newValue = newValue {
                for value in newValue {
                    self._data.append(value as! IDLDBFlashcardData)
                }
            }
        }
    }
    
    var back: Bool {
        get {
            return self._back
        }
        set {
            self._back = newValue
        }
    }
    
    var connectedFlashcard: IDFlashcard? {
        get {
            return self._connectedFlashcard as? IDFlashcard
        }
        set {
            self._connectedFlashcard = newValue as? IDLDBFlashcard
        }
    }
    
    private let _data = List<IDLDBFlashcardData>()
    private dynamic var _back: Bool = false
    private dynamic var _connectedFlashcard: IDLDBFlashcard?
    
    override static func ignoredProperties() -> [String] {
        return ["data", "back", "connectedFlashcard"]
    }
}