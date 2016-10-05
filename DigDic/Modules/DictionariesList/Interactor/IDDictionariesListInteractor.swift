//
//  IDDictionariesListIDDictionariesListInteractor.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionariesListInteractor: IDDictionariesListInteractorInput {

    weak var output: IDDictionariesListInteractorOutput!
    lazy var service: IDDictionaryService = IDDictionaryService(source: IDLocalDataBaseSource())

    // MARK: IDDictionariesListInteractorInput
    func fetchDictionaries(_ competion: ([IDDictionary]) -> ()) {
        self.service.fetchDictionaries {(dictionaries: [IDDictionary]) in
            competion(dictionaries)
        }
    }
    
    func addNewDictionaryWithName(_ name: String) {
        self.service.addDictionaryWithName(name)
    }
    
    func removeDictionary(_ dictionary: IDDictionary) {
        self.service.removeDictionary(dictionary)
    }
    
}
