//
//  IDLocalDataBaseSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class LocalDataBaseSource: Service {
    
    // MARK: IDDictionarySourceProtocol
    func fetchDictionaries(_ completion: ([Dictionary]) -> ()) {
        let realm = try! Realm()
        let result = realm.objects(LDBDictionary.self)
        let array = Array(result)
        let dictionaries = array.map{$0 as Dictionary}
        completion(dictionaries as [Dictionary])
    }
    
    func addDictionaryWithName(_ name: String) {
        let newDictionary = LDBDictionary()
        newDictionary.name = name
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(newDictionary)
        }
    }
    
    func cardModelForFilling() -> Card {
        let card = LDBCard()
        return card
    }
    
    func addCardDataWithImageName(_ imageName: String) -> CardData {
        let cardData = LDBCardData()
        cardData.imageName = imageName
        cardData.type = .Image
        let realm = try! Realm()
        try! realm.write {
            realm.add(cardData)
        }
        return cardData
    }
    
    func addCardDataWith(text: String) -> CardData {
        let cardData = LDBCardData()
        cardData.type = .Text
        cardData.text = text
        let realm = try! Realm()
        try! realm.write {
            realm.add(cardData)
        }
        return cardData
    }
    
    func createFlashcard(_ frontCard: Card, backCard: Card, toDictionary dictionary: Dictionary) -> Flashcard? {
        guard let frontCard = frontCard as? LDBCard else {
            return nil
        }
        guard let backCard = backCard as? LDBCard else {
            return nil
        }
        guard let dictionary = dictionary as? LDBDictionary else {
            return nil
        }
        let flashcard = LDBFlashcard()
        flashcard.frontCard = frontCard
        flashcard.backCard = backCard
        let realm = try! Realm()
        try! realm.write {
            realm.add(flashcard)
            dictionary.addFlashcard(flashcard)
        }
        return flashcard
    }
    
    func removeFlashcard(_ flashcard: Flashcard, fromDictionary dictionary: Dictionary) {
        guard let flashcard = flashcard as? LDBFlashcard else {
            return
        }
        guard let dictionary = dictionary as? LDBDictionary else {
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
    
    func removeDictionary(_ dictionary: Dictionary) {
        guard let dictionary = dictionary as? LDBDictionary else {
            return
        }
        for flashcard in dictionary.flashcards {
            self.removeFlashcard(flashcard, fromDictionary: dictionary)
        }
        let realm = try! Realm()
        try! realm.write {
            realm.delete(dictionary)
        }
    }
    
    // this method should be called into write transaction
    fileprivate func _removeCard(_ card: Card?) {
        guard let card = card as? LDBCard else {
            return
        }
        
        let realm = try! Realm()
        if let data = card.data as? [LDBCardData] {
            realm.delete(data)
        }
        realm.delete(card)
    }
    
}
