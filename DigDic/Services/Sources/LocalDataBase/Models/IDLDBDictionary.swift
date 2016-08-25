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
    var words: [IDWord] {
        return self._words.map{$0 as IDWord}
    }
    
    // MARK: Private
    let _words = List<IDLDBWord>()
}