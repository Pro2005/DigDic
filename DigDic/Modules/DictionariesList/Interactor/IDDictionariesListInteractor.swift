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
    func fetchDictionaries(competion: ([IDDictionaryProtocol]) -> ()) {
        service.fetchDictionaries {(dictionaries: [IDDictionaryProtocol]) in
            competion(dictionaries)
        }
    }
    
    func addNewDictionaryWithName(name: String) {
        service.addDictionaryWithName(name)
    }
    
}
