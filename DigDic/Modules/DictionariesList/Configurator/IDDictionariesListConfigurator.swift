//
//  IDDictionariesListIDDictionariesListConfigurator.swift
//  DigDic
//
//  Created by Ilya Denisov on 18/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDDictionariesListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? IDDictionariesListViewController {
            configure(viewController)
        }
    }

    fileprivate func configure(_ viewController: IDDictionariesListViewController) {

        let router = IDDictionariesListRouter(viewController: viewController)

        let presenter = IDDictionariesListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = IDDictionariesListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.dataDisplayManager = IDDictionariesListDataDisplayManager()
    }

}
