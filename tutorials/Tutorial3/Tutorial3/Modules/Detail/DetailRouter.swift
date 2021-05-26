//
//  DetailRouter.swift
//  Tutorial3
//
//  Created by Su Van Ho on 21/05/2021.
//  
//

import UIKit

protocol DetailRouterInput: AnyObject {
}

final class DetailRouter {

    weak var view: DetailViewInput?

    private var viewController: UIViewController? {
        view as? UIViewController
    }
}

// MARK: - DetailRouterInput

extension DetailRouter: DetailRouterInput {
}
