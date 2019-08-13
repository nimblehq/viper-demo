//
//  RepoModule.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import UIKit

final class RepoModule {
    
    let view: RepoViewController
    let presenter: RepoPresenter
    let router: RepoRouter
    let interactor: RepoInteractor

    var output: RepoOutput? { 
        get { return presenter.output }
        set { presenter.output = newValue }
    }

    var input: RepoInput? { 
        return presenter
    }

    init(repoId: Int) {
        self.view = RepoViewController()
        self.presenter = RepoPresenter()
        self.router = RepoRouter()
        let repoService = Services.shared.network().repoNetwork()
        let imageService = Services.shared.network().imageNetwork()

        self.interactor = RepoInteractor(repoId: repoId,
                                    repoService: repoService,
                                    imageService: imageService)

        view.output = presenter
        
        presenter.view = view
        presenter.router = router 
        presenter.interactor = interactor
        presenter.output = output

        interactor.output = presenter

        router.view = view
    }

}
