//
//  Router.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

protocol Router: class {
    associatedtype View
    var view: View { get set }
}
