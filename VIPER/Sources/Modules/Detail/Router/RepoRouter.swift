//
//  RepoRouter.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import UIKit
import SafariServices

final class RepoRouter {
    weak var view: RepoViewController?
}

// MARK: - VIPER
extension RepoRouter: Router {}

// MARK: - RepoRouterInput
extension RepoRouter: RepoRouterInput {
    func back() {
        view?.navigationController?.popViewController(animated: true)
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "viper".uppercased(), message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func openWebPage(at path: String) {
        guard let url = URL(string: path) else { return }
        let controller = SFSafariViewController(url: url)
        view?.present(controller, animated: true)
    }
}
