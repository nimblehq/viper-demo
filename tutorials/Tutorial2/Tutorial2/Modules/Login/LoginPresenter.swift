//
//  LoginPresenter.swift
//  Tutorial2
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import UIKit

final class LoginPresenter {

    let router: LoginRouterInput
    let userInteractor: UserInteractor

    weak var view: LoginViewInput?
    weak var output: LoginOutput?

    init(router: LoginRouterInput, userInteractor: UserInteractor) {
        self.router = router
        self.userInteractor = userInteractor
    }
}

// MARK: - LoginViewOutput

extension LoginPresenter: LoginViewOutput {

    func viewDidLoad() {
        view?.configure()
        view?.prefill(email: "admin@admin.admin", pass: "admin")
    }

    func loginButtonDidTap(email: String, pass: String) {
        if userInteractor.validate(email: email) && userInteractor.validate(pass: pass) {
            userInteractor.logIn(email: email, pass: pass)
        } else {
            view?.showAlert(message: "Invalid Inputs")
        }
    }
}

// MARK: - UserInteractorOutput
extension LoginPresenter: UserInteractorOutput {

    func userDidLogin() {
        router.showHome()
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
