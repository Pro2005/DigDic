//
//  IDDictionaryDetailIDDictionaryDetailInteractor.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDDictionaryDetailInteractor: IDDictionaryDetailInteractorInput {

    weak var output: IDDictionaryDetailInteractorOutput!
    lazy var service: IDDictionaryService = IDDictionaryService(source: IDLocalDataBaseSource())
    lazy var imageManager: IDImageManager = IDImageManager()

    func removeFlashcards(flashcards: [IDFlashcard], fromDictinary dictionary: IDDictionary) {
        for flashcard in flashcards {
            if let data = flashcard.data {
                for dataItem in data {
                    if let imageName = dataItem.imageName {
                        do {
                            try self.imageManager.removeImageWithFilename(imageName)
                        } catch {
                            
                        }
                    }
                }
            }
        }
        self.service.removeFlashcards(flashcards, fromDictionary: dictionary)
    }
    
}
