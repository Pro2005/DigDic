//
//  IDDictionariesListIDDictionariesListInteractorInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDDictionariesListInteractorInput: IDBaseInteractorInput {
    var dataSource: [IDDictionaryProtocol] {get}

    func fetchDictionaries(competion: () -> ())
    func addNewDictionaryWithName(name: String)
    func dictionaryByIndex(index: Int) -> IDDictionaryProtocol?
    
}
