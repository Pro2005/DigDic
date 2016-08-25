//
//  DictionaryDetailIDDictionaryDetailPresenter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionaryDetailPresenter: IDDictionaryDetailModuleInput, IDDictionaryDetailViewOutput, IDDictionaryDetailInteractorOutput {

    weak var view: IDDictionaryDetailViewInput!
    var interactor: IDDictionaryDetailInteractorInput!
    var router: IDDictionaryDetailRouterInput!
    let selectedDictionary: IDDictionaryProtocol
    
    init(selectedDictionary: IDDictionaryProtocol) {
        self.selectedDictionary = selectedDictionary
    }

    func viewIsReady() {
        view.setupInitialState()
        if let dictionaryName = self.selectedDictionary.name {
            self.view.updateTitle(dictionaryName)
        }
    }
}
