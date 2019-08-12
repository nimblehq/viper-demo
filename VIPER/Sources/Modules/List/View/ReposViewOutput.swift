//
//  ReposViewOutput.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ReposViewOutput: class {
    func fetch()
    func detail(at index: Int)
}
