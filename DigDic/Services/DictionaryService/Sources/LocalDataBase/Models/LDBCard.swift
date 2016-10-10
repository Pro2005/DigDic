//
//  IDLDBCard.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/9/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class LDBCard: Object, Card {

    var data: [CardData]? {
        get {
            return self._data.map{$0 as CardData}
        }
        set {
            self._data.removeAll()
            if let newValue = newValue {
                for value in newValue {
                    self._data.append(value as! LDBCardData)
                }
            }
        }
    }
    
    fileprivate let _data = List<LDBCardData>()
    
    override static func ignoredProperties() -> [String] {
        return ["data"]
    }
    
}
