//
//  IDAddFlashcardIDAddFlashcardInteractorInput.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDAddFlashcardInteractorInput: IDBaseInteractorInput {

    func addFlashcardWithDataHolders(dataHolders: [IDAddFlashcardDataHolder], toDictionary dictionary: IDDictionary) -> IDFlashcard
    func connectFlashcardsTogether(inout faceFlashcard: IDFlashcard, inout backFlashcard: IDFlashcard)
    
}
