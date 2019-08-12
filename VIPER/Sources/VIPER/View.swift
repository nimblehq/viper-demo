//
//  View.swift
//  viper
//
//  Created by Su Van Ho on 9/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit

protocol View: class {
    associatedtype Presenter
    var output: Presenter { get set }
}