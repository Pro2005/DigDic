//
//  DictionariesListIDDictionariesListPresenter.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

class IDDictionariesListPresenter: NSObject, IDDictionariesListModuleInput, IDDictionariesListViewOutput, IDDictionariesListInteractorOutput {

    weak var view: IDDictionariesListViewInput!
    var interactor: IDDictionariesListInteractorInput!
    var router: IDDictionariesListRouterInput!
    
    // MARK: IDDictionariesListViewOutput
    func viewIsReady() {
        view.setupInitialState()
        self.updateData {[weak self] (items: [IDDictionary]) in
            self?.view.reloadDataWithDictionaries(items)
        }
    }
    
    func didTapAddButton() {
        self.view.showFormForCreatingNewDictionary()
    }
    
    func didTapCreateDictionaryButtonWithDictionaryName(name: String) {
        self.interactor.addNewDictionaryWithName(name)
        self.updateData {[weak self] (items: [IDDictionary]) in
            self?.view.reloadDataWithDictionaries(items)
        }
    }
    
    func didSelectDictionary(dictionary: IDDictionary) {
        self.router.pushDictionaryDetailScreenWithDictionary(dictionary)
    }
    
    // MARK: Private
    
    private func updateData(completion: ([IDDictionary] -> ())) {
        interactor.fetchDictionaries { (items: [IDDictionary]) in
            completion(items)
        }
    }
    
}