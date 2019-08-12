//
//  RepoInteractorOutput.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol RepoInteractorOutput: class {
    func didSuccess(with item: RepoItem)
    func didLoadImage(with data: Data)
    func didFail(with error: Error)
}
