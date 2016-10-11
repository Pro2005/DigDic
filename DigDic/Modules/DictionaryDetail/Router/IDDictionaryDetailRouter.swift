//
//  DictionaryDetailIDDictionaryDetailRouter.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailRouter: BaseRouter, IDDictionaryDetailRouterInput {

    func presentAddFlashcardForDictionary(_ dictionary: Dictionary, delegate: IDAddFlashcardPresenterDelegate?) {
        guard let navigationController = self.viewController.navigationController else {
            return
        }
        let viewController = IDAddFlashcardViewController()
        IDAddFlashcardModuleConfigurator().configureModuleForViewInput(viewController, dictionary: dictionary, delegate: delegate)
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
}
