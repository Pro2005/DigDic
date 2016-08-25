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
    var dataSource: [IDDictionary] = [IDDictionary]()
    
    // MARK: IDDictionariesListViewOutput
    func viewIsReady() {
        view.setupInitialState()
        view.setupTableViewDataSource(self, delegate: self)
        self._updateDataForDataSource(&self.dataSource) { [unowned self] in
            self.view.reloadData()
        }
    }
    
    func addDictionary() {
        let alertController = UIAlertController(title: "Add dictionary", message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField) in
            textField.placeholder = "name of new dictionary"
        }
        let addAction = UIAlertAction(title: "Add", style: .Default) { [unowned self](alertAction: UIAlertAction) in
            guard let textField = alertController.textFields?.first else {
                return
            }
            guard let text = textField.text else {
                return
            }
            self.interactor.addNewDictionaryWithName(text)
            self._updateDataForDataSource(&self.dataSource, completion: { 
                self.view.reloadData()
            })
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { (alertAction: UIAlertAction) in
            
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.view.showAlertController(alertController)
    }
    
    // MARK: Private
    private func _updateDataForDataSource(inout dataSource: [IDDictionary], completion: () -> ()) {
        interactor.fetchDictionaries {(items: [IDDictionary]) in
            dataSource.removeAll()
            dataSource += items
            completion()
        }
    }
    
}