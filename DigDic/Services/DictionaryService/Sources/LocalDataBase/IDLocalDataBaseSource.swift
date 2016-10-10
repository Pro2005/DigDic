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
    func fetchDictionaries(_ completion: ([IDDictionary]) -> ()) {
        let realm = try! Realm()
        let result = realm.objects(IDLDBDictionary.self)
        let array = Array(result)
        let dictionaries = array.map{$0 as IDDictionary}
        completion(dictionaries as [IDDictionary])
    }
    
    func addDictionaryWithName(_ name: String) {
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
    
    func addCardDataWithImageName(_ imageName: String) -> IDCardData {
        let cardData = IDLDBCardData()
        cardData.imageName = imageName
        cardData.type = .Image
        let realm = try! Realm()
        try! realm.write {
            realm.add(cardData)
        }
        return cardData
    }
    
    func addCardDataWith(text: String) -> IDCardData {
        let cardData = IDLDBCardData()
        cardData.type = .Text
        cardData.text = text
        let realm = try! Realm()
        try! realm.write {
            realm.add(cardData)
        }
        return cardData
    }
    
    func createFlashcard(_ frontCard: IDCard, backCard: IDCard, toDictionary dictionary: IDDictionary) -> IDFlashcard? {
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
    
    func removeFlashcard(_ flashcard: IDFlashcard, fromDictionary dictionary: IDDictionary) {
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
    
    func removeDictionary(_ dictionary: IDDictionary) {
        guard let dictionary = dictionary as? IDLDBDictionary else {
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
    fileprivate func _removeCard(_ card: IDCard?) {
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
