//
//  LoginInteractor.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import Foundation

protocol LoginInteractorInput: AnyObject {

    func login(email: String, pass: String)
}

protocol LoginInteractorOutput: AnyObject {

    func userDidLogin()
    func userDidFailToLogin(message: String)
}

final class LoginInteractor {

    weak var output: LoginInteractorOutput?
}

// MARK: - LoginInteractorInput

extension LoginInteractor: LoginInteractorInput {

    func login(email: String, pass: String) {
        guard email.isEmail && !pass.isEmpty else {
            output?.userDidFailToLogin(message: "Invalid inputs")
            return
        }
        // just fake login logic
        if email.lowercased() == "admin@admin.admin" && pass.lowercased() == "admin" {
            output?.userDidLogin()
        } else {
            output?.userDidFailToLogin(message: "Wrong email or password!")
        }
    }
}
