//
//  MyAccountPresenter.swift
//  Tutorial2
//
//  Created by Su Van Ho on 16/05/2021.
//  
//

final class MyAccountPresenter {

    let router: MyAccountRouterInput
    let userInteractor: UserInteractorInput

    weak var view: MyAccountViewInput?
    weak var output: MyAccountOutput?

    init(router: MyAccountRouterInput, userInteractor: UserInteractorInput) {
        self.router = router
        self.userInteractor = userInteractor
    }
}

// MARK: - MyAccountViewOutput

extension MyAccountPresenter: MyAccountViewOutput {

    func viewDidLoad() {
        view?.configure()
        if let email = userInteractor.savedEmail {
            view?.configureUserView(username: "Admin", email: email)
        }
    }

    func logoutButtonDidTap() {
        userInteractor.logOut()
        router.showLogin()
    }
}

// MARK: - MyAccountInput

extension MyAccountPresenter: MyAccountInput {
}
