//
//  IDAddWordIDAddWordConfigurator.swift
//  DigDic
//
//  Created by ls on 26/08/2016.
//  Copyright © 2016 Ilya Denisov. All rights reserved.
//

import UIKit

class IDAddWordModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? IDAddWordViewController {
            configure(viewController)
        }
    }

    private func configure(viewController: IDAddWordViewController) {

        let router = IDAddWordRouter(viewController: viewController)

        let presenter = IDAddWordPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = IDAddWordInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
