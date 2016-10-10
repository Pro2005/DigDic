//
//  IDWordProtocol.swift
//  DigDic
//
//  Created by Ilya Denisov on 8/24/16.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation

protocol IDFlashcard: class {
    
    var frontCard: IDCard? {get set}
    var backCard: IDCard? {get set}

}
