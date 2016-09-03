//
//  AddFlashcardIDAddFlashcardPresenter.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

class IDAddFlashcardPresenter: NSObject, IDAddFlashcardModuleInput, IDAddFlashcardViewOutput, IDAddFlashcardInteractorOutput {

    weak var view: IDAddFlashcardViewInput!
    var interactor: IDAddFlashcardInteractorInput!
    var router: IDAddFlashcardRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func didTapCloseButton() {
        self.router.dismiss()
    }
    
    func didTapAddButton() {
//        let numberWords = self.view.numberWords()
//        for wordIndex in 0..<numberWords {
//            if let dataHolders = self.view.dataHoldersForWordNumber(wordIndex) {
//                
//            }
//        }
    }
    
    func didTapAddImageButton() {
        self.view.addFormForSelectingImage()
    }
    
    func didTapSelectImageButton(dataHolder: IDAddFlashcardDataHolder) {
        self.view.displayDialogForSelectingImage { (result) in
            if let image = result {
                self.view.displayDialogForCropImage(image, dataHolder: dataHolder)
            }
        }
    }
    
    func didCropImage(image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
        self.view.updateImageForDataHolder(image, dataHolder: dataHolder)
    }
    
    // MARK: Private
    
    
    
}
