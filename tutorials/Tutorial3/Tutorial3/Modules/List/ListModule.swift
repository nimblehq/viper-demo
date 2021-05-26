//
//  ListModule.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//  
//

import UIKit

protocol ListInput: AnyObject {

    func setInitialModule(on window: UIWindow)
}

protocol ListOutput: AnyObject {
}

final class ListModule {

    let view: ListViewController
    let presenter: ListPresenter
    let router: ListRouter

    let getListBeersInteractor: GetListBeersInteractor

    var output: ListOutput? {
        get { presenter.output }
        set { presenter.output = newValue }
    }

    var input: ListInput { presenter }

    init() {
        view = ListViewController()
        router = ListRouter()
        getListBeersInteractor = GetListBeersInteractor()
        presenter = ListPresenter(router: router, getListBeersInteractor: getListBeersInteractor)

        view.output = presenter

        presenter.view = view

        router.view = view

        getListBeersInteractor.output = presenter
    }
}
