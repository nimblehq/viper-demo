//
//  ReposRouter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class ReposRouter {
    
    weak var view: ReposViewInput?

    private var viewController: UIViewController? { 
        return view as? UIViewController
    }

}

// MARK: - ReposRouterInput

extension ReposRouter: ReposRouterInput {

}