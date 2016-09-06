//
//  DictionaryDetailIDDictionaryDetailRouter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailRouter: IDBaseRouter, IDDictionaryDetailRouterInput {

    func presentAddFlashcardForDictionary(dictionary: IDDictionary, delegate: IDAddFlashcardPresenterDelegate?) {
        guard let navigationController = self.viewController.navigationController else {
            return
        }
        let viewController = IDAddFlashcardViewController()
        IDAddFlashcardModuleConfigurator().configureModuleForViewInput(viewController, dictionary: dictionary, delegate: delegate)
        navigationController.presentViewController(viewController, animated: true, completion: nil)
    }
    
}
