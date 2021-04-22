//
//  UIView+AccessibilitySettable.swift
//  DemoViper
//
//  Created by Nguyen M. Tam on 11/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import UIKit

extension UIView: AccessibilitySettable {

    func setIdentifier(_ identifier: String) {
        accessibilityIdentifier = identifier
        accessibilityLabel = identifier
    }
}

