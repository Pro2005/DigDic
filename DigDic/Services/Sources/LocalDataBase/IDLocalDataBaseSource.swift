//
//  IDLocalDataBaseSource.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/23/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLocalDataBaseSource: IDDictionarySourceProtocol {
    
    // MARK: IDDictionarySourceProtocol
    func fetchDictionaries(completion: ([IDDictionaryProtocol]) -> ()) {
        let realm = try! Realm()
        let result = realm.objects(IDLDBDictionary)
        let dictionaries = result.map{$0 as IDDictionaryProtocol}
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
    
}