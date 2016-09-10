//
//  DictionaryDetailIDDictionaryDetailPresenter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionaryDetailPresenter: IDDictionaryDetailModuleInput, IDDictionaryDetailViewOutput, IDDictionaryDetailInteractorOutput, IDAddFlashcardPresenterDelegate {

    weak var view: IDDictionaryDetailViewInput!
    var interactor: IDDictionaryDetailInteractorInput!
    var router: IDDictionaryDetailRouterInput!
    let selectedDictionary: IDDictionary
    let reverseOrder: Bool
    
    init(selectedDictionary: IDDictionary, reverseOrder: Bool) {
        self.selectedDictionary = selectedDictionary
        self.reverseOrder = reverseOrder
    }

    func viewIsReady() {
        view.setupInitialState()
        if let dictionaryName = self.selectedDictionary.name {
            self.view.updateTitle(dictionaryName)
        }
        self.view.displayFlashcards(self.selectedDictionary.flashcards, reverseOrder: self.reverseOrder)
    }
    
    func didTapAddButton() {
        self.router.presentAddFlashcardForDictionary(self.selectedDictionary, delegate: self)
    }
    
    func didTapRemoveButton() {
        self.view.getConfirmationForRemoving()
    }
    
    func removeFlashcard(flashcard: IDFlashcard) {
        self.interactor.removeFlashcard(flashcard, fromDictinary: self.selectedDictionary)
        
    }
    
    // MARK: - IDAddFlashcardPresenterDelegate 
    
    func addFlashcardPresenterDidAddFlashcard(flashcard: IDFlashcard) {
        self.view.displayFlashcards([flashcard], reverseOrder: self.reverseOrder)
    }
    
}
