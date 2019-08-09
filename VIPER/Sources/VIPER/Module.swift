//
//  Module.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © e2019 Nimble. All rights reserved.
//

import Foundation

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
