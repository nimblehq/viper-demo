//
//  ReposInteractorOutput.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol ReposInteractorOutput: AnyObject {
    func didSuccess(with repos: [String])
    func didFail(with error: Error)
}
