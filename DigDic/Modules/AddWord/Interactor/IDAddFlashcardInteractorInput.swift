//
//  IDAddFlashcardIDAddFlashcardInteractorInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddFlashcardInteractorInput: IDBaseInteractorInput {

    func addCardWithDataHolders(_ dataHolders: [IDAddFlashcardDataHolder], toDictionary dictionary: IDDictionary) -> IDCard?
    func createFlashcardWithfrontCard(_ frontCard: IDCard, backCart: IDCard, addToDictionary dictionary: IDDictionary) -> IDFlashcard?
    
}
