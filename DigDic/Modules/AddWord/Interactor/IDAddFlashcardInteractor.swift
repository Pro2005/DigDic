//
//  IDAddFlashcardIDAddFlashcardInteractor.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddFlashcardInteractor: IDAddFlashcardInteractorInput {

    weak var output: IDAddFlashcardInteractorOutput!
    lazy var service: IDDictionaryService = IDDictionaryService(source: IDLocalDataBaseSource())
    
    func addFlashcardWithDataHolders(dataHolders: [IDAddFlashcardDataHolder]) -> IDFlashcard {
        let flashcard = service.flashcardModelForFilling()
//        dataHolders.map{ dataHolder in
//            switch dataHolder {
//            case let imageDataHolder as IDAddFlashcardImageDataHolder:
//                if let image = imageDataHolder.image {
//                    
//                }
//            }
//        }
        return flashcard
    }
    
}
