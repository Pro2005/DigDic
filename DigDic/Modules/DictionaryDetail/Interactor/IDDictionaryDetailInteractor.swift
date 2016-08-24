//
//  IDDictionaryDetailIDDictionaryDetailInteractor.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionaryDetailInteractor: IDDictionaryDetailInteractorInput {

    weak var output: IDDictionaryDetailInteractorOutput!
    var dictionary: IDDictionaryProtocol
    
    init(dictionary: IDDictionaryProtocol) {
        self.dictionary = dictionary
    }

}
