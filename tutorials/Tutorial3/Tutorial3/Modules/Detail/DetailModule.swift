//
//  DetailModule.swift
//  Tutorial3
//
//  Created by Su Van Ho on 21/05/2021.
//  
//

protocol DetailInput: AnyObject {
}

protocol DetailOutput: AnyObject {
}

final class DetailModule {

    let view: DetailViewController
    let presenter: DetailPresenter
    let router: DetailRouter

    let getDetailBeerInteractor: GetDetailBeerInteractor

    var output: DetailOutput? {
        get { presenter.output }
        set { presenter.output = newValue }
    }

    var input: DetailInput { presenter }

    init(beerId: Int) {
        view = DetailViewController()
        router = DetailRouter()
        getDetailBeerInteractor = GetDetailBeerInteractor()
        presenter = DetailPresenter(router: router, getDetailBeerInteractor: getDetailBeerInteractor, beerId: beerId)

        view.output = presenter

        presenter.view = view

        router.view = view

        getDetailBeerInteractor.output = presenter
    }
}
