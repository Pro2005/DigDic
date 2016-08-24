//
//  IDDictionaryDetailIDDictionaryDetailConfigurator.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, dictionary: IDDictionaryProtocol) {

        if let viewController = viewInput as? IDDictionaryDetailViewController {
            configure(viewController, dictionary: dictionary)
        }
    }

    private func configure(viewController: IDDictionaryDetailViewController, dictionary: IDDictionaryProtocol) {

        let router = IDDictionaryDetailRouter()

        let presenter = IDDictionaryDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = IDDictionaryDetailInteractor(dictionary: dictionary)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
