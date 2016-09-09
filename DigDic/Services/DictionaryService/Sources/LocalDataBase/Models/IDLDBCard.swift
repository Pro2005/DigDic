//
//  IDLDBCard.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/9/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import RealmSwift

class IDLDBCard: Object, IDCard {

    var data: [IDCardData]? {
        get {
            return self._data.map{$0 as IDCardData}
        }
        set {
            if let newValue = newValue {
                for value in newValue {
                    self._data.append(value as! IDLDBCardData)
                }
            }
        }
    }
    
    private let _data = List<IDLDBCardData>()
    
    override static func ignoredProperties() -> [String] {
        return ["data"]
    }
    
}