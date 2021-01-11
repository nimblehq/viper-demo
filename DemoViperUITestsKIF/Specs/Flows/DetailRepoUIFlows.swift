//
//  DetailRepoUIFlows.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import KIF

extension KIFTestActor {

    private typealias Screen = DetailRepo

    func tapBookmarkButton() {
        // Because there may be bookmark buttons on different screens.
        // Hence, it is recommended to verify the screen in which the back button is.
        do {
            let view = tester().waitForView(withAccessibilityLabel: DetailRepo.authorView.identifier)
            expect(view?.isUserInteractionEnabled).toEventually(beTrue(), timeout: .long)

            try tester().tryFindingView(withAccessibilityLabel: Screen.view.identifier)
            tester().waitAndTapView(with: General.bookmarkButton.identifier)
        } catch {
            Nimble.fail("View is hidden. \n+ Identifier: \(Screen.view.identifier)")
        }
    }
}
