//
//  SceneDelegate.swift
//  Tutorial2
//
//  Created by Su Van Ho on 07/05/2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        if let window = window {
            let userInteractor = UserInteractor()
            if userInteractor.isLoggedIn {
                let myAccountModule = MyAccountModule()
                myAccountModule.router.show(on: window)
            } else {
                let loginModule = LoginModule()
                loginModule.router.show(on: window)
            }
            window.makeKeyAndVisible()
        }
    }
}
