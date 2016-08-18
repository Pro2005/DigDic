//
//  DictionariesListIDDictionariesListPresenter.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionariesListPresenter: IDDictionariesListModuleInput, IDDictionariesListViewOutput, IDDictionariesListInteractorOutput {

    weak var view: IDDictionariesListViewInput!
    var interactor: IDDictionariesListInteractorInput!
    var router: IDDictionariesListRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}
