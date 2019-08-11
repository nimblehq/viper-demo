//
//  ReposPresenter.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposPresenter {
    weak var view: ReposViewInput!
    var router: ReposRouterInput!
    var interactor: ReposInteractorInput!
}

// MARK: - VIPER
extension ReposPresenter: Presenter {}

// MARK: - Connect to View
extension ReposPresenter: ReposViewOutput {
    func fetch() {
    }
    
    func add() {
    }
}

// MARK: - TodosInteractorOutput
extension ReposPresenter: ReposInteractorOutput {}
