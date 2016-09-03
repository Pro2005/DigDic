//
//  IDAddFlashcardIDAddFlashcardConfigurator.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddFlashcardModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? IDAddFlashcardViewController {
            configure(viewController)
        }
    }

    private func configure(viewController: IDAddFlashcardViewController) {

        let router = IDAddFlashcardRouter(viewController: viewController)

        let presenter = IDAddFlashcardPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = IDAddFlashcardInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
