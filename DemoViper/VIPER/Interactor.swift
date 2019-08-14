//
//  Interactor.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

/// These protocols is defined for people who want to take a look on a big picture of VIPER, optional for using.
///
/// Interactor contains the business logic as specified by a UseCase
protocol Interactor: AnyObject {
    associatedtype Presenter

    /// This property is used like a delegate, from Interactor, using this property when you need some action that made by Presenter
    var output: Presenter { get set }
}
