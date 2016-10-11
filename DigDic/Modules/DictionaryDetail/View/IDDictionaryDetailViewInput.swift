//
//  DictionaryDetailIDDictionaryDetailViewInput.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//
import UIKit

protocol IDDictionaryDetailViewInput: BaseViewInput {

    /**
        @author ls
        Setup initial state of the view
    */

    func setupInitialState()
    func updateTitle(_ title: String)
    func displayFlashcards(_ flashcards: [Flashcard], reverseOrder: Bool)
    func showNextFlashcards()
    func getConfirmationForRemoving()

}
