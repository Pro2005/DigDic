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
    var dataSource: [IDDictionaryProtocol] = [IDDictionaryProtocol]()

    // MARK: IDDictionariesListInteractorInput
    func fetchDictionaries(competion: () -> ()) {
        service.fetchDictionaries { [unowned self] (dictionaries: [IDDictionaryProtocol]) in
            self.dataSource = dictionaries
            competion()
        }
    }
    
    func addNewDictionaryWithName(name: String) {
        service.addDictionaryWithName(name)
    }
    
    func dictionaryByIndex(index: Int) -> IDDictionaryProtocol? {
        guard index < dataSource.count else {
            return nil
        }
        return dataSource[index]
    }

}
