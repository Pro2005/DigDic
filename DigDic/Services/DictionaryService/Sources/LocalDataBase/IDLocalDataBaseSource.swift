//
//  IDLocalDataBaseSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLocalDataBaseSource: IDDictionarySource {
    
    // MARK: IDDictionarySourceProtocol
    func fetchDictionaries(completion: ([IDDictionary]) -> ()) {
        let realm = try! Realm()
        let result = realm.objects(IDLDBDictionary)
        let dictionaries = result.map{$0 as IDDictionary}
        completion(dictionaries)
    }
    
    func addDictionaryWithName(name: String) {
        let newDictionary = IDLDBDictionary()
        newDictionary.name = name
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(newDictionary)
        }
    }
    
    func cardModelForFilling() -> IDCard {
        let card = IDLDBCard()
        return card
    }
    
    func addCardDataWithImageName(imageName: String) -> IDCardData {
        let cardData = IDLDBCardData()
        cardData.imageName = imageName
        cardData.type = .Image
        let realm = try! Realm()
        try! realm.write {
            realm.add(cardData)
        }
        return cardData
    }
    
    func createFlashcard(frontCard: IDCard, backCard: IDCard, toDictionary dictionary: IDDictionary) -> IDFlashcard? {
        guard let frontCard = frontCard as? IDLDBCard else {
            return nil
        }
        guard let backCard = backCard as? IDLDBCard else {
            return nil
        }
        guard let dictionary = dictionary as? IDLDBDictionary else {
            return nil
        }
        let flashcard = IDLDBFlashcard()
        flashcard.frontCard = frontCard
        flashcard.backCard = backCard
        let realm = try! Realm()
        try! realm.write {
            realm.add(flashcard)
            dictionary.addFlashcard(flashcard)
        }
        return flashcard
    }
    
    func removeFlashcard(flashcard: IDFlashcard, fromDictionary dictionary: IDDictionary) {
        guard let flashcard = flashcard as? IDLDBFlashcard else {
            return
        }
        guard let dictionary = dictionary as? IDLDBDictionary else {
            return
        }
        
        let realm = try! Realm()
        try! realm.write {
            self._removeCard(flashcard.frontCard)
            self._removeCard(flashcard.backCard)
            dictionary.removeFlashcard(flashcard)
            realm.delete(flashcard)
        }
    }
    
    // this method should be called into write transaction
    private func _removeCard(card: IDCard?) {
        guard let card = card as? IDLDBCard else {
            return
        }
        
        let realm = try! Realm()
        if let data = card.data as? [IDLDBCardData] {
            realm.delete(data)
        }
        realm.delete(card)
    }
    
}