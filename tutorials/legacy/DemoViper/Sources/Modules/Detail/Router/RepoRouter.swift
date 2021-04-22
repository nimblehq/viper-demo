//
//  RepoRouter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit
import SafariServices

// sourcery: AutoMockable
protocol RepoRouterInput: AnyObject {
    func back()
    func showError(_ error: Error)
    func openWebPage(at path: String)
}

final class RepoRouter {
    
    weak var view: RepoViewInput?

    private var viewController: UIViewController? { 
        return view as? UIViewController
    }

}

// MARK: - RepoRouterInput
extension RepoRouter: RepoRouterInput {
    func back() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "viper".uppercased(), message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func openWebPage(at path: String) {
        guard let url = URL(string: path) else { return }
        let controller = SFSafariViewController(url: url)
        viewController?.present(controller, animated: true)
        controller.setIdentifiersForViews(with: [
            General.webview.identifier: controller.view
        ])
        controller.view.accessibilityValue = path
    }
}
