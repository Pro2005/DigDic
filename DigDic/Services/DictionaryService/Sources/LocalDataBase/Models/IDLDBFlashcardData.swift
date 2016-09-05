//
//  IDLDBFlashcardData.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBFlashcardData: Object, IDFlashcardData {
    
    dynamic var text: String?
    dynamic var imageName: String?
    
    
    var type: IDFlashcardDataType? {
        get {
            return IDFlashcardDataType(rawValue: self._type)!
        }
        set {
            if let newValue = newValue {
                self._type = newValue.rawValue
            }
        }
    }
    
    dynamic var _type = IDFlashcardDataType.Text.rawValue
    
}