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
    }
    
    func didTapCloseButton() {
        self.router.dismiss()
    }
    
    func didTapAddImageButton() {
        self.view.addFormForSelectingImage()
    }
    
    func didTapSelectImageButton(completion: (result: UIImage?) -> Void) {
        self.view.displayDialogForSelectingImage(completion)
    }
    
    // MARK: Private
    
    
    
}
