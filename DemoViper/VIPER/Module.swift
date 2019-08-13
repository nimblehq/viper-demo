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
protocol Module {
    associatedtype View
    associatedtype Presenter
    associatedtype Router
    associatedtype Interactor
    var view: View { get }
    var presenter: Presenter { get }
    var router: Router { get }
    var interactor: Interactor { get }
}
