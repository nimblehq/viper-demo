//
//  GeneralUIFlows.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import XCTest

extension XCUIApplication {

    func tapBackButton(
        onScreen screenIdentifier: String
    ) {
        // Because there may be back buttons on different screens.
        // Hence, it is recommended to verify the screen in which the back button is.
        let view = views[screenIdentifier].firstMatch
        guard view.exists else {
            Nimble.fail("View is hidden. \n+ Identifier: \(screenIdentifier)")
            return
        }
        buttons[General.backButton.identifier].firstMatch.tap()
    }
}
