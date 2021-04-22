//
//  UIViewController+Identifier.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 11/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import UIKit

extension UIViewController {

    func setIdentifiersForViews(with info: [String: AccessibilitySettable?]) {
        info.forEach { (identifier, view) in
            view?.setIdentifier(identifier)
        }
    }
}
