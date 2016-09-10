//
//  DictionariesListIDDictionariesListRouter.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListRouter: IDBaseRouter, IDDictionariesListRouterInput {

    func pushDictionaryDetailScreenWithDictionary(dictionary: IDDictionary, reverseOrder: Bool) {
        guard let navigationController = self.viewController.navigationController else {
            return
        }
        let viewController = IDDictionaryDetailViewController()
        IDDictionaryDetailModuleConfigurator().configureModuleForViewInput(viewController, dictionary: dictionary, reverseOrder: reverseOrder)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}