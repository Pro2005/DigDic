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

    func viewIsReady() {

    }
}
