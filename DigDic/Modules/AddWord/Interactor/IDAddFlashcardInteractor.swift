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
    lazy var imageManager: IDImageManager = IDImageManager()
    
    func addFlashcardWithDataHolders(dataHolders: [IDAddFlashcardDataHolder], toDictionary dictionary: IDDictionary) -> IDFlashcard {
        var flashcard = service.flashcardModelForFilling()
        for dataHolder in dataHolders {
            if let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder {
                if let image = imageDataHolder.image {
                    if let filename = self.imageManager.saveImage(image) {
                        flashcard.data!.append(self.service.addFlashcardDataWithImageName(filename))
                    }
                }
            }
        }
        self.service.addFlashcard(flashcard, toDictionary: dictionary)
        return flashcard
    }
    
    func connectFlashcardsTogether(inout faceFlashcard: IDFlashcard, inout backFlashcard: IDFlashcard) {
        self.service.connectFlashcardsTogether(&faceFlashcard, backFlashcard: &backFlashcard)
    }
    
}
