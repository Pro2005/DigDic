//
//  IDAddFlashcardIDAddFlashcardConfigurator.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddFlashcardModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController, dictionary: Dictionary, delegate: IDAddFlashcardPresenterDelegate?) {

        if let viewController = viewInput as? IDAddFlashcardViewController {
            configure(viewController, dictionary: dictionary, delegate: delegate)
        }
    }

    fileprivate func configure(_ viewController: IDAddFlashcardViewController, dictionary: Dictionary, delegate: IDAddFlashcardPresenterDelegate?) {

        let router = IDAddFlashcardRouter(viewController: viewController)

        let presenter = IDAddFlashcardPresenter(dictionary: dictionary)
        presenter.view = viewController
        presenter.router = router
        presenter.delegate = delegate

        let interactor = IDAddFlashcardInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
