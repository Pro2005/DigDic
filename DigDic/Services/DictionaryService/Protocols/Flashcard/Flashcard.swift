//
//  IDWordProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol Flashcard: class {
    
    var frontCard: Card? {get set}
    var backCard: Card? {get set}

}
