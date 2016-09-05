//
//  IDFlashcardData.swift
//  DigDic
//
//  Created by Ilya Denisov on 9/4/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

enum IDFlashcardDataType: String {
    case Image
    case Text
}

protocol IDFlashcardData {
    
    var text: String? {get set}
    var imageName: String? {get set}
    var type: IDFlashcardDataType? {get set}
    
}