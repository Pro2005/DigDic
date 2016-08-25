//
//  IDDictionaryDetailIDDictionaryDetailConfigurator.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, dictionary: IDDictionary) {

        if let viewController = viewInput as? IDDictionaryDetailViewController {
            configure(viewController, dictionary: dictionary)
        }
    }

    private func configure(viewController: IDDictionaryDetailViewController, dictionary: IDDictionary) {

        let router = IDDictionaryDetailRouter()

        let presenter = IDDictionaryDetailPresenter(selectedDictionary: dictionary)
        presenter.view = viewController
        presenter.router = router

        let interactor = IDDictionaryDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
