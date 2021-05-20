//
//  LoginModule.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

protocol LoginInput: AnyObject {

    func setInitialModule(on window: UIWindow)
}

protocol LoginOutput: AnyObject {
}

final class LoginModule {

    let view: LoginViewController
    let presenter: LoginPresenter
    let router: LoginRouter

    let userInteractor: UserInteractor

    var output: LoginOutput? {
        get { presenter.output }
        set { presenter.output = newValue }
    }

    var input: LoginInput { presenter }

    init() {
        userInteractor = UserInteractor()

        view = LoginViewController()
        router = LoginRouter()
        presenter = LoginPresenter(router: router, userInteractor: userInteractor)

        view.output = presenter

        presenter.view = view

        router.view = view

        userInteractor.output = presenter
    }
}
