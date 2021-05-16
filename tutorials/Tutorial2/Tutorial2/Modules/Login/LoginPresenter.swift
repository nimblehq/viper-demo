//
//  LoginPresenter.swift
//  Tutorial2
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

final class LoginPresenter {

    let router: LoginRouterInput
    let userInteractor: UserInteractor

    weak var view: LoginViewInput?
    weak var output: LoginOutput?
    private var email: String?

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

    func didTapLoginButton(email: String, pass: String) {
        self.email = email
        if userInteractor.validate(email: email) && userInteractor.validate(pass: pass) {
            userInteractor.login(email: email, pass: pass)
        } else {
            view?.showAlert(message: "Invalid Inputs")
        }
    }
}

// MARK: - UserInteractorOutput
extension LoginPresenter: UserInteractorOutput {

    func userDidLogin() {
        userInteractor.isLoggedIn = true
        userInteractor.savedEmail = email
        router.showHome()
    }

    func userDidFailToLogin(message: String) {
        view?.showAlert(message: message)
    }
}

// MARK: - LoginInput

extension LoginPresenter: LoginInput {
}
