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

    let loginInteractor: LoginInteractor

    var output: LoginOutput? {
        get { presenter.output }
        set { presenter.output = newValue }
    }

    var input: LoginInput { presenter }

    init() {
        loginInteractor = LoginInteractor()

        view = LoginViewController()
        router = LoginRouter()
        presenter = LoginPresenter(router: router, loginInteractor: loginInteractor)

        view.output = presenter

        presenter.view = view

        router.view = view

        loginInteractor.output = presenter
    }
}
