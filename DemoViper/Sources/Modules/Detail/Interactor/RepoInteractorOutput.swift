//
//  RepoInteractorOutput.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol RepoInteractorOutput: AnyObject {
    func didSuccess(with item: RepoItem)
    func didLoadImage(with data: Data)
    func didFail(with error: Error)
}
