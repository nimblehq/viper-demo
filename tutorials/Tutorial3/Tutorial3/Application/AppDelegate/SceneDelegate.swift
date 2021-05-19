//
//  SceneDelegate.swift
//  Tutorial3
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
            let module = ListModule()
            module.input.setInitialModule(on: window)
        }
    }
}
