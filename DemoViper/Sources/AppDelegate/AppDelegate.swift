//
//  AppDelegate.swift
//  DemoViper
//
//  Created by Issarapong Poesua on 8/10/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var reposInput: ReposInput?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        let router = RootRouter()
        reposInput = router.showRepos(on: window)
        return true
    }
}
