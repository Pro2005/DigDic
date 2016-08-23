//
//  IDDictionaryService.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

class IDDictionaryService: IDBaseService {
    var source: IDDictionarySourceProtocol
    
    init(source: IDDictionarySourceProtocol) {
        self.source = source
    }
    
    // MARK: Public
    func fetchDictionaries(completion: ([IDDictionaryProtocol]) -> ()) {
        self.source.fetchDictionaries(completion)
    }
    
    func addDictionaryWithName(name: String) {
        self.source.addDictionaryWithName(name)
    }
    
}