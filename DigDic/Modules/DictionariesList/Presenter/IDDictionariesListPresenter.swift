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
            self?.view.reloadDataWith(Dictionaries: items)
        }
    }
    
    func didTapAddButton() {
        self.view.showFormForCreatingNewDictionary()
    }
    
    func didTapCreateDictionaryButtonWithDictionaryName(_ name: String) {
        self.interactor.addNewDictionaryWithName(name)
        self.updateData {[weak self] (items: [IDDictionary]) in
            self?.view.reloadDataWith(Dictionaries: items)
        }
    }
    
    func didSelectDictionary(_ dictionary: IDDictionary, reverseOrder: Bool) {
        self.router.pushDictionaryDetailScreenWithDictionary(dictionary, reverseOrder: reverseOrder)
    }
    
    func wantRemoveDictionary(_ dictionary: IDDictionary) {
        self.interactor.removeDictionary(dictionary)
        self.updateData {[weak self] (items: [IDDictionary]) in
            self?.view.reloadDataWith(Dictionaries: items)
        }
    }
    
    // MARK: Private
    
    fileprivate func updateData(_ completion: (([IDDictionary]) -> ())) {
        interactor.fetchDictionaries { (items: [IDDictionary]) in
            completion(items)
        }
    }
    
}
