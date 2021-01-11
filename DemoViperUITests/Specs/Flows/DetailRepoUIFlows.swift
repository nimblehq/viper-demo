//
//  DetailRepoUIFlows.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import XCTest

extension XCUIApplication {

    private typealias Screen = DetailRepo

    func tapBookmarkButton() {
        // Because there may be bookmark buttons on different screens.
        // Hence, it is recommended to verify the screen in which the back button is.
        let view = views[Screen.view.identifier].firstMatch
        guard view.exists else {
            Nimble.fail("View is hidden. \n+ Identifier: \(Screen.view.identifier)")
            return
        }
        let bookmarkButton = buttons[General.bookmarkButton.identifier].firstMatch
        expect(bookmarkButton.exists && bookmarkButton.isHittable)
            .toEventually(beTrue(), timeout: .long)
        // TODO: - If we don't validate the author view, the repo cell is not marked as bookmarked
        let authorView = views[DetailRepo.authorView.identifier].firstMatch
        expect(authorView.exists && authorView.isHittable)
            .toEventually(beTrue(), timeout: .long)
        bookmarkButton.tap()
    }

    func tapAuthorView() {
        let view = views[DetailRepo.authorView.identifier].firstMatch
        expect(view.exists && view.isHittable)
            .toEventually(beTrue(), timeout: .long)
        view.tap()
    }
}
