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
        let numberCards = self.view.numberFlashcards()
        var flashcards = [IDFlashcard]()
        for cardNumber in 0 ..< numberCards {
            if let dataHolders = self.view.dataHoldersForFlashcardWithNumber(cardNumber) {
                let flashcard = self.interactor.addFlashcardWithDataHolders(dataHolders, toDictionary: self.dictionary)
                flashcards.append(flashcard)
            }
        }
        
        if flashcards.count == 2 {
            var faceFlashcard = flashcards.first!
            var backFlashcard = flashcards.last!
            self.interactor.connectFlashcardsTogether(&faceFlashcard, backFlashcard: &backFlashcard)
            if let delegate = self.delegate {
                delegate.addFlashcardPresenterDidAddFlashcards(faceFlashcard, backFlashcard: backFlashcard)
            }
        }
        
        self.router.dismiss()
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
