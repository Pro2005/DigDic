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
    
    init(selectedDictionary: IDDictionary) {
        self.selectedDictionary = selectedDictionary
    }

    func viewIsReady() {
        view.setupInitialState()
        if let dictionaryName = self.selectedDictionary.name {
            self.view.updateTitle(dictionaryName)
        }
        let flashcards = self.selectedDictionary.cards.filter{$0.back == false}
        self.view.displayFlashcards(flashcards)
    }
    
    func didTapAddButton() {
        self.router.presentAddFlashcardForDictionary(self.selectedDictionary, delegate: self)
    }
    
    func didTapRemoveButton() {
        self.view.getConfirmationForRemoving()
    }
    
    func removeFlashcards(flashcards: [IDFlashcard]) {
        self.interactor.removeFlashcards(flashcards, fromDictinary: self.selectedDictionary)
    }
    
    // MARK: - IDAddFlashcardPresenterDelegate 
    
    func addFlashcardPresenterDidAddFlashcards(faceFlashcard: IDFlashcard, backFlashcard: IDFlashcard) {
        self.view.displayFlashcards([faceFlashcard])
    }
    
}
