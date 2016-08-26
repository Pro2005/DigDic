//
//  AddWordIDAddWordPresenter.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

class IDAddWordPresenter: NSObject, IDAddWordModuleInput, IDAddWordViewOutput, IDAddWordInteractorOutput {

    weak var view: IDAddWordViewInput!
    var interactor: IDAddWordInteractorInput!
    var router: IDAddWordRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        view.setupBackTableViewDataSource(self, delegate: self)
        view.setupFrontTableViewDataSource(self, delegate: self)
    }
    
    func closePressed() {
        
    }
    
    // MARK: Private
    
    
    
}