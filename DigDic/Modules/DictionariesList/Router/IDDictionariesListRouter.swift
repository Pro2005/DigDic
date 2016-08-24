//
//  DictionariesListIDDictionariesListRouter.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListRouter: IDDictionariesListRouterInput {

    func pushDictionaryDetailScreenWithDictionary(dictionary: IDDictionaryProtocol, navigationController: UINavigationController) {
        let viewController = IDDictionaryDetailViewController()
        IDDictionaryDetailModuleConfigurator().configureModuleForViewInput(viewController)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}