//
//  RepoInteractorInput.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol RepoInteractorInput: class {
    func getInfo()
    func authorPath() -> String
}
