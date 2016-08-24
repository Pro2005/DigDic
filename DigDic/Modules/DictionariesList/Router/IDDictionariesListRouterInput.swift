//
//  DictionariesListIDDictionariesListRouterInput.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import Foundation
import UIKit

protocol IDDictionariesListRouterInput: IDBaseRouterInput {

    func pushDictionaryDetailScreenWithDictionary(dictionary: IDDictionaryProtocol, navigationController: UINavigationController)
    
}
