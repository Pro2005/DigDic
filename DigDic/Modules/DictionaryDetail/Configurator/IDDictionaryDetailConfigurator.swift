//
//  IDDictionaryDetailIDDictionaryDetailConfigurator.swift
//  DigDic
//
//  Created by ls on 24/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionaryDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController, dictionary: IDDictionary, reverseOrder: Bool) {

        if let viewController = viewInput as? IDDictionaryDetailViewController {
            configure(viewController, dictionary: dictionary, reverseOrder: reverseOrder)
        }
    }

    fileprivate func configure(_ viewController: IDDictionaryDetailViewController, dictionary: IDDictionary, reverseOrder: Bool) {

        let router = IDDictionaryDetailRouter(viewController: viewController)

        let presenter = IDDictionaryDetailPresenter(selectedDictionary: dictionary, reverseOrder: reverseOrder)
        presenter.view = viewController
        presenter.router = router

        let interactor = IDDictionaryDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
