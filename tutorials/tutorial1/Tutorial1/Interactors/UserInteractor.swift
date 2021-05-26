//
//  UserInteractor.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import Foundation

protocol UserInteractorInput: AnyObject {

    func login(email: String, pass: String)
}

protocol UserInteractorOutput: AnyObject {

    func userDidLogin()
    func userDidFailToLogin(message: String)
}

final class UserInteractor {

    weak var output: UserInteractorOutput?
}

// MARK: - UserInteractorInput

extension UserInteractor: UserInteractorInput {

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
