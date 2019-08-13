//
//  View.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

/// These protocols is defined for people who want to take a look on a big picture of VIPER, optional for using.
///
/// View displays what it is told by the Presenter and relays user input back to the Presenter
protocol View: class {
    associatedtype Presenter

    /// View use presenter for respond or handle the event from user, or some actions that request data
    var output: Presenter { get set }
}
