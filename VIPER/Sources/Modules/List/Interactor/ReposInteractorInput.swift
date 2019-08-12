//
//  ReposInteractorInput.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ReposInteractorInput: class {
    func getRepos()
    func getRepoId(at index: Int) -> Int?
}
