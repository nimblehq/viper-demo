//
//  RepoRouterInput.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol RepoRouterInput: class {
    func back()
    func showError(_ error: Error)
    func openWebPage(at path: String)
}
