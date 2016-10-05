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
    let dictionary: IDDictionary!
    var delegate: IDAddFlashcardPresenterDelegate?
    
    init(dictionary: IDDictionary) {
        self.dictionary = dictionary
    }

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func didTapCloseButton() {
        self.router.dismiss()
    }
    
    func didTapAddButton() {
        guard let frontCard = self.interactor.addCardWithDataHolders(self.view.frontDataHolders(), toDictionary: self.dictionary) else {
            return
        }
        guard let backCard = self.interactor.addCardWithDataHolders(self.view.backDataHolders(), toDictionary: self.dictionary) else {
            return
        }
        
        guard let flashcard = self.interactor.createFlashcardWithfrontCard(frontCard, backCart: backCard, addToDictionary: self.dictionary) else {
            return
        }
        
        if let delegate = self.delegate {
            delegate.addFlashcardPresenterDidAddFlashcard(flashcard)
        }
        
        self.router.dismiss()
    }
    
    func didTapAddImageButton() {
        self.view.addFormForSelectingImage()
    }
    
    func didTapAddTextButton() {
        self.view.addFormForText()
    }
    
    func didTapSelectImageButton(_ dataHolder: IDAddFlashcardDataHolder) {
        self.view.displayDialogForSelectingImage { (result) in
            if let image = result {
                self.view.displayDialogForCropImage(image, dataHolder: dataHolder)
            }
        }
    }
    
    func didCropImage(_ image: UIImage, dataHolder: IDAddFlashcardDataHolder) {
        self.view.updateImageForDataHolder(image, dataHolder: dataHolder)
    }
    
    // MARK: Private
    
    
    
}
