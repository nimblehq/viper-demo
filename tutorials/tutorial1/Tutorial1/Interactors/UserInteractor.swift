//
//  UserInteractor.swift
//  Tutorial1
//
//  Created by Su Van Ho on 07/05/2021.
//  
//

import Foundation

protocol UserInteractorInput: AnyObject {

    func validate(email: String) -> Bool
    func validate(pass: String) -> Bool
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

    func validate(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }

    func validate(pass: String) -> Bool {
        return !pass.isEmpty
    }

    func login(email: String, pass: String) {
        // just fake login logic
        if email.lowercased() == "admin@admin.admin" && pass.lowercased() == "admin" {
            output?.userDidLogin()
        } else {
            output?.userDidFailToLogin(message: "Wrong email or password!")
        }
    }
}
