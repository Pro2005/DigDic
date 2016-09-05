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
            
        }
    }
    
    var back: Bool {
        get {
            return self._back
        }
        set {
            
        }
    }
    
    var card: IDFlashcard? {
        get {
            return self._card as? IDFlashcard
        }
        set {
            
        }
    }
    
    private let _data = List<IDLDBFlashcardData>()
    private var _back: Bool = false
    private dynamic var _card: IDLDBFlashcard?
}