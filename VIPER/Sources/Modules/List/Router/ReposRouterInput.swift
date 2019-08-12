//
//  ReposRouterInput.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ReposRouterInput: class {
    func detail(with id: Int)
    func showError(_ error: Error)
}
