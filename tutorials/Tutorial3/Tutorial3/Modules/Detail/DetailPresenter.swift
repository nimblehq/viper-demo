//
//  DetailPresenter.swift
//  Tutorial3
//
//  Created by Su Van Ho on 21/05/2021.
//  
//

import Foundation

final class DetailPresenter {

    let router: DetailRouterInput
    let getDetailBeerInteractor: GetDetailBeerInteractorInput

    weak var view: DetailViewInput?
    weak var output: DetailOutput?

    private let beerId: Int

    init(router: DetailRouterInput, getDetailBeerInteractor: GetDetailBeerInteractorInput, beerId: Int) {
        self.router = router
        self.getDetailBeerInteractor = getDetailBeerInteractor
        self.beerId = beerId
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {

    func viewDidLoad() {
        view?.configure()
        getDetailBeerInteractor.getBeer(with: beerId)
    }
}

// MARK: - BeerInteractorOutput

extension DetailPresenter: GetDetailBeerInteractorOutput {

    func didGetBeer(_ beer: Beer) {
        let viewModel = DetailViewController.ViewModel(
            title: beer.name,
            imageURL: URL(string: beer.imageURLString),
            description: beer.description
        )
        view?.configure(viewModel)
    }

    func didFailToGetBeer(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - DetailInput

extension DetailPresenter: DetailInput {
}
