//
//  Module.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © e2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

/// These protocols is defined for people who want to take a look on a big picture of VIPER, optional for using.
///
/// Module is used for wrap your module, it contains View, Presenter, Router, Interactor and connect all parts of VIPER together.
protocol Module: AnyObject {
    associatedtype View
    associatedtype Presenter
    associatedtype Router
    associatedtype Interactor
    associatedtype Input
    associatedtype Output

    var view: View { get }
    var presenter: Presenter { get }
    var router: Router { get }
    var interactor: Interactor { get }

    // We will use input and output for Submodule
    /// This input will be implemented by Presenter, this is what outside can ask module to do something.
    var input: Input { get }

    /// This output is the output of Presenter, this is kind of module's delegate.
    var output: Output { get set }
}
