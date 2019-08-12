//
//  ReposInteractorOutput.swift
//  viper
//
//  Created by Su Van Ho on 11/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ReposInteractorOutput: class {
    func didSuccess(with repos: [String])
    func didFail(with error: Error)
}
