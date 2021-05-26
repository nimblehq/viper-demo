//
//  LoginPresenter.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

final class LoginPresenter {

    let router: LoginRouterInput
    let loginInteractor: LoginInteractor

    weak var view: LoginViewInput?
    weak var output: LoginOutput?

    init(router: LoginRouterInput, loginInteractor: LoginInteractor) {
        self.router = router
        self.loginInteractor = loginInteractor
    }
}

// MARK: - LoginViewOutput

extension LoginPresenter: LoginViewOutput {

    func viewDidLoad() {
        view?.configure()
    }

    func loginButtonDidTap(email: String, pass: String) {
        loginInteractor.login(email: email, pass: pass)
    }
}

// MARK: - LoginInteractorOutput
extension LoginPresenter: LoginInteractorOutput {

    func userDidLogin() {
        view?.showAlert(message: "Login Successful!")
    }

    func userDidFailToLogin(message: String) {
        view?.showAlert(message: message)
    }
}

// MARK: - LoginInput

extension LoginPresenter: LoginInput {

    func setInitialModule(on window: UIWindow) {
        router.show(on: window)
    }
}
