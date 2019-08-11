//
//  ReposInteractor.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

final class ReposInteractor {
    weak var output: ReposInteractorOutput!
}

// MARK: - VIPER
extension ReposInteractor: Interactor {}

// MARK: - TodosInteractorInput
extension ReposInteractor: ReposInteractorInput {
    
}
