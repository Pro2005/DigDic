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
    
    func didTapSelectImageButton(dataHolder: IDAddWordDataHolder) {
        self.view.displayDialogForSelectingImage { (result) in
            if let image = result {
                self.view.displayDialogForCropImage(image, dataHolder: dataHolder)
            }
        }
    }
    
    func didCropImage(image: UIImage, dataHolder: IDAddWordDataHolder) {
        self.view.updateImageForDataHolder(image, dataHolder: dataHolder)
    }
    
    // MARK: Private
    
    
    
}
