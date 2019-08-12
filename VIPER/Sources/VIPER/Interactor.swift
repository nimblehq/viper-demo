//
//  Interactor.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation
protocol Interactor {
    associatedtype Presenter

    /// This property is used like a delegate, from Interactor, using this property when you need some action that made by Presenter
    var output: Presenter { get set }
}
