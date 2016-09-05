//
//  DictionaryDetailIDDictionaryDetailPresenter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionaryDetailPresenter: IDDictionaryDetailModuleInput, IDDictionaryDetailViewOutput, IDDictionaryDetailInteractorOutput {

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
        if let flashcard = flashcards.first {
            self.view.displayFlashcard(flashcard)
        }
    }
    
    func didTapAddButton() {
        self.router.presentAddFlashcardForDictionary(self.selectedDictionary)
    }
    
    // MARK: Private 
    
    private func flashcardViewForFlashcard(flashcard: IDFlashcard) -> IDDictionaryDetailFlashcardView {
        let view = IDDictionaryDetailFlashcardView(flashcard: flashcard)
        
        return view
    }
    
}
