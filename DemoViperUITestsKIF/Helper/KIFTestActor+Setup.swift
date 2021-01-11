//
//  KIFTestActor+Setup.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import KIF

@testable import DemoViper

internal func setupTestEnvironment() {
    UIApplication.shared.animationSpeed = 2.0
    KIFTypist.setKeystrokeDelay(.keystrokeDelay)
    KIFTestActor.setDefaultTimeout(.short)
    KIFTestActor.setDefaultAnimationWaitingTimeout(.medium)
    KIFTestActor.setDefaultAnimationStabilizationTimeout(.medium)
}

internal func resetTestEnvironment() -> Bool {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
          let window = appDelegate.window else {
        return false
    }
    let router = RootRouter()
    appDelegate.reposInput = router.showRepos(on: window)
    return true
}
