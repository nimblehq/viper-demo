//
//  ReposModule.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol ReposInput: AnyObject {}

// sourcery: AutoMockable
protocol ReposOutput: AnyObject {}

final class ReposModule {
    
    let view: ReposViewController
    let presenter: ReposPresenter
    let router: ReposRouter
    let interactor: ReposInteractor

    var output: ReposOutput? { 
        get { return presenter.output }
        set { presenter.output = newValue }
    }

    var input: ReposInput? { 
        return presenter
    }

    init() { 
        self.view = ReposViewController()
        self.presenter = ReposPresenter()
        self.router = ReposRouter()
        let service = Services.shared.network.repository
        self.interactor = ReposInteractor(service: service)

        view.output = presenter
        
        presenter.view = view
        presenter.router = router 
        presenter.interactor = interactor
        presenter.output = output

        interactor.output = presenter

        router.view = view
    }

}
