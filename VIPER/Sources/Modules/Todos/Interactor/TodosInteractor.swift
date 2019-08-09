//
//  TodosInteractor.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class TodosInteractor {
    weak var output: TodosInteractorOutput!
}

// MARK: - VIPER
extension TodosInteractor: Interactor {}

// MARK: - TodosInteractorInput
extension TodosInteractor: TodosInteractorInput {
    
}
