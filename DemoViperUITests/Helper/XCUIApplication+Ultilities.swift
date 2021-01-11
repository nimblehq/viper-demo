//
//  XCUIApplication+Ultilities.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import XCTest

extension XCUIApplication {

    var views: XCUIElementQuery {
        return descendants(matching: .any)
    }

    func filterCells(containing label: String) -> XCUIElementQuery {
        return cells.containing(NSPredicate(format: "label CONTAINS %@", label))
    }
}
