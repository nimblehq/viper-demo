//
//  ReposViewInput.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ReposViewInput: class {
    func showEmptyMessage()
    func showData(_ data: [String])
}

