//
//  ListPresenter.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//  
//

import UIKit

final class ListPresenter {

    let router: ListRouterInput
    let getListBeersInteractor: GetListBeersInteractorInput

    weak var view: ListViewInput?
    weak var output: ListOutput?

    private var beers: [Beer] = []

    init(router: ListRouterInput, getListBeersInteractor: GetListBeersInteractorInput) {
        self.router = router
        self.getListBeersInteractor = getListBeersInteractor
    }
}

// MARK: - ListViewOutput

extension ListPresenter: ListViewOutput {

    func viewDidLoad() {
        view?.configure()
        getListBeersInteractor.fetchBeers()
    }

    func numberOfItems() -> Int { beers.count }

    func viewModel(at index: Int) -> BeerItemCell.ViewModel {
        let beer = beers[index]
        return BeerItemCell.ViewModel(
            title: beer.name,
            description: beer.description,
            imageURL: URL(string: beer.imageURLString)
        )
    }

    func didSelectRow(at index: Int) {
        let beer = beers[index]
        router.showDetailScreen(beer.id)
    }
}

// MARK: - BeerInteractorOutput

extension ListPresenter: GetListBeersInteractorOutput {

    func didGetBeers(_ beers: [Beer]) {
        self.beers = beers
        view?.reloadData()
    }

    func didFailToGetBeers(error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: - ListInput

extension ListPresenter: ListInput {

    func setInitialModule(on window: UIWindow) {
        router.show(on: window)
    }
}
