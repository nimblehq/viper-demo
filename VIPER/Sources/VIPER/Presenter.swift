//
//  Presenter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol Presenter: class {
    associatedtype View
    associatedtype Router
    associatedtype Interactor
    
    var view: View! { get set }
    var router: Router! { get set }
    var interactor: Interactor! { get set }
}
