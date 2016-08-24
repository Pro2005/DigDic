//
//  IDLDBDictionary.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBDictionary: Object, IDDictionaryProtocol {
    // MARK: IDDictionaryProtocol
    dynamic var name: String?
    var words: [IDWordProtocol] {
        return self._words.map{$0 as IDWordProtocol}
    }
    
    // MARK: Private
    let _words = List<IDLDBWord>()
}