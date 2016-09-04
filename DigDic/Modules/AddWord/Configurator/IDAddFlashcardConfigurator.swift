//
//  IDAddFlashcardIDAddFlashcardConfigurator.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddFlashcardModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, dictionary: IDDictionary) {

        if let viewController = viewInput as? IDAddFlashcardViewController {
            configure(viewController, dictionary: dictionary)
        }
    }

    private func configure(viewController: IDAddFlashcardViewController, dictionary: IDDictionary) {

        let router = IDAddFlashcardRouter(viewController: viewController)

        let presenter = IDAddFlashcardPresenter(dictionary: dictionary)
        presenter.view = viewController
        presenter.router = router

        let interactor = IDAddFlashcardInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
