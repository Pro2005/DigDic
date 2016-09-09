//
//  IDFlashcardData.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

enum IDCardDataType: String {
    case Image
    case Text
}

protocol IDCardData {
    
    var text: String? {get set}
    var imageName: String? {get set}
    var type: IDCardDataType? {get set}
    
}