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
    var imageNames: [IDFlashcardImage]? {
        get {
            return self._imageNames.map{$0 as IDFlashcardImage}
        }
        set {
            
        }
    }
    
    var texts: [IDFlashcardText]? {
        get {
            return self._texts.map{$0 as IDFlashcardText}
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
    
    private let _imageNames = List<IDLDBFlashcardImage>()
    private let _texts = List<IDLDBFlashcardText>()
    private var _back: Bool = false
    private dynamic var _card: IDLDBFlashcard?
}