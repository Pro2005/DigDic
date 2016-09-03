//
//  IDAddWordIDAddWordInteractor.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddWordInteractor: IDAddWordInteractorInput {

    weak var output: IDAddWordInteractorOutput!
    lazy var service: IDDictionaryService = IDDictionaryService(source: IDLocalDataBaseSource())
    

    
}
