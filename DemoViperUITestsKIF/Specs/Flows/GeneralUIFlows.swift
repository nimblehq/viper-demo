//
//  GeneralUIFlows.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import KIF

extension KIFTestActor {

    func tapBackButton(
        onScreen screenIdentifier: String
    ) {
        // Because there may be back buttons on different screens.
        // Hence, it is recommended to verify the screen in which the back button is.
        do {
            try tester().tryFindingView(withAccessibilityLabel: screenIdentifier)
            tester().waitAndTapView(with: General.backButton.identifier)
        } catch {
            Nimble.fail("View is hidden. \n+ Identifier: \(screenIdentifier)")
        }
    }

    func resetToRootScreen() {
        do {
            try tester().tryRunning({ _ -> KIFTestStepResult in
                return resetTestEnvironment() ? .success : .failure
            }, complete: { (result, error) in
                switch result {
                case .success:
                    print("Backing to root view has been success.")
                case .failure:
                    print("Backing to root view has been failed. Error: \(error?.localizedDescription ?? "")")
                case .wait:
                    print("Backing to root view has been waited.")
                default:
                    break
                }
            }, timeout: TimeInterval.long)
        } catch {
            print("Backing to root view has been failed. Error: \(error.localizedDescription)")
        }
    }
}
