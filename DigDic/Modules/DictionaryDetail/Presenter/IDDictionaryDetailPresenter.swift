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
    let selectedDictionary: Dictionary
    let reverseOrder: Bool
    
    init(selectedDictionary: Dictionary, reverseOrder: Bool) {
        self.selectedDictionary = selectedDictionary
        self.reverseOrder = reverseOrder
    }

    func viewIsReady() {
        view.setupInitialState()
        if let dictionaryName = self.selectedDictionary.name {
            view.updateTitle(dictionaryName)
        }
        view.displayFlashcards(self.selectedDictionary.flashcards, reverseOrder: self.reverseOrder)
    }
    
    func didTapAddButton() {
        router.presentAddFlashcardForDictionary(self.selectedDictionary, delegate: self)
    }
    
    func didTapRemoveButton() {
        view.getConfirmationForRemoving()
    }
    
    func removeFlashcard(_ flashcard: Flashcard) {
        interactor.removeFlashcard(flashcard, fromDictinary: self.selectedDictionary)
    }
    
    func didRightSwipe() {
        view.showNextFlashcards()
    }
    
    func didLeftSwipe() {
        view.showNextFlashcards()
    }
    
    // MARK: - IDAddFlashcardPresenterDelegate 
    
    func addFlashcardPresenterDidAddFlashcard(_ flashcard: Flashcard) {
        self.view.displayFlashcards([flashcard], reverseOrder: self.reverseOrder)
    }
    
}
