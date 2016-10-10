//
//  IDAddFlashcardIDAddFlashcardInteractor.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

class IDAddFlashcardInteractor: IDAddFlashcardInteractorInput {

    weak var output: IDAddFlashcardInteractorOutput!
    lazy var service: Service = LocalDataBaseSource()
    lazy var imageManager: IDImageManager = IDImageManager()
    
    func addCardWithDataHolders(_ dataHolders: [IDAddFlashcardDataHolder], toDictionary dictionary: Dictionary) -> Card? {
        var card = service.cardModelForFilling()
        for dataHolder in dataHolders {
            if let imageDataHolder = dataHolder as? IDAddFlashcardImageDataHolder {
                if let image = imageDataHolder.image {
                    do {
                        if let filename = try self.imageManager.saveImage(image) {
                            card.data?.append(self.service.addCardDataWithImageName(filename))
                        }
                    } catch {
                        
                    }
                }
            } else if let textDataHolder = dataHolder as? IDAddFlashcardTextDataHolder {
                if let text = textDataHolder.text {
                    card.data?.append(self.service.addCardDataWith(text: text))
                }
            }
        }
        return card
    }
    
    func createFlashcardWithfrontCard(_ frontCard: Card, backCart: Card, addToDictionary dictionary: Dictionary) -> Flashcard? {
        return self.service.createFlashcard(frontCard, backCard: backCart, toDictionary: dictionary)
    }
    
}
