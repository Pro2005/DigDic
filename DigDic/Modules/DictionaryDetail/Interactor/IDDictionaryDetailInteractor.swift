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

    func removeFlashcard(_ flashcard: IDFlashcard, fromDictinary dictionary: IDDictionary) {
        self._removeImagesForCardData(flashcard.frontCard?.data)
        self._removeImagesForCardData(flashcard.backCard?.data)
        self.service.removeFlashcard(flashcard, fromDictionary: dictionary)
    }
    
    // MARK: - Private
    
    fileprivate func _removeImagesForCardData(_ cardData: [IDCardData]?) {
        if let data = cardData {
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
    
}
