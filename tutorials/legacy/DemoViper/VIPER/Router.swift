//
//  Router.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

/// These protocols is defined for people who want to take a look on a big picture of VIPER, optional for using.
///
/// Router contains navigation logic for describing which screens are shown in which order
protocol Router: AnyObject {
    associatedtype View

    /// Router will use this view to change to another view
    ///
    /// Some types of this property: UIWindow, UINavigationController, UIViewController...
    var view: View { get set }
}
