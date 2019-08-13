//
//  Presenter.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

/// These protocols is defined for people who want to take a look on a big picture of VIPER, optional for using.
///
/// Presenter contains View logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from Interactor)
protocol Presenter: AnyObject {
    associatedtype View
    associatedtype Router
    associatedtype Interactor
    
    /// Presenter will connect to view, so when they need view do something, presenter will call this property
    var view: View { get set }

    /// Presenter will use router for routing the app to another module
    var router: Router { get set }

    /// Presenter will use interactor to request data
    var interactor: Interactor { get set }
}
