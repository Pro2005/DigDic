//
//  DictionaryDetailIDDictionaryDetailRouter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailRouter: IDBaseRouter, IDDictionaryDetailRouterInput {

    func presentAddWordForDictionary(dictionary: IDDictionary) {
        guard let navigationController = self.viewController.navigationController else {
            return
        }
        let viewController = IDAddWordViewController()
        IDAddWordModuleConfigurator().configureModuleForViewInput(viewController)
        navigationController.presentViewController(viewController, animated: true, completion: nil)
    }
    
}
