//
//  ReposPresenter.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class ReposPresenter {

    weak var view: ReposViewInput?
    var router: ReposRouterInput?
    var interactor: ReposInteractorInput?

    var output: ReposOutput?

}

// MARK: - ReposViewOutput

extension ReposPresenter: ReposViewOutput {

    func viewDidLoad() { 
        view?.configure()
    }
    
}

// MARK: - ReposInteractorOutput

extension ReposPresenter: ReposInteractorOutput { 

}

// MARK: - ReposInput

extension ReposPresenter: ReposInput { 
    
}