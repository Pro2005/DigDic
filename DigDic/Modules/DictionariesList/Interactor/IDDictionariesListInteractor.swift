//
//  IDDictionariesListIDDictionariesListInteractor.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionariesListInteractor: IDDictionariesListInteractorInput {

    weak var output: IDDictionariesListInteractorOutput!
    lazy var service: Service = LocalDataBaseSource()

    // MARK: IDDictionariesListInteractorInput
    func fetchDictionaries(_ competion: ([Dictionary]) -> ()) {
        self.service.fetchDictionaries {(dictionaries: [Dictionary]) in
            competion(dictionaries)
        }
    }
    
    func addNewDictionaryWithName(_ name: String) {
        self.service.addDictionaryWithName(name)
    }
    
    func removeDictionary(_ dictionary: Dictionary) {
        self.service.removeDictionary(dictionary)
    }
    
}
