//
//  MyAccountModule.swift
//  Tutorial2
//
//  Created by Su Van Ho on 16/05/2021.
//  
//

import UIKit

protocol MyAccountInput: AnyObject {

    func setInitialModule(on window: UIWindow)
}

protocol MyAccountOutput: AnyObject {
}

final class MyAccountModule {

    let view: MyAccountViewController
    let presenter: MyAccountPresenter
    let router: MyAccountRouter

    let userInteractor: UserInteractor

    var output: MyAccountOutput? {
        get { presenter.output }
        set { presenter.output = newValue }
    }

    var input: MyAccountInput { presenter }

    init() {
        view = MyAccountViewController()
        router = MyAccountRouter()

        userInteractor = UserInteractor()

        presenter = MyAccountPresenter(router: router, userInteractor: userInteractor)

        view.output = presenter

        presenter.view = view

        router.view = view
    }
}
