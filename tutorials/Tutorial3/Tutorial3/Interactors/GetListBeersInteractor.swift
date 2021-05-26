//
//  GetListBeersInteractor.swift
//  Tutorial3
//
//  Created by Su Van Ho on 19/05/2021.
//

import Moya

protocol GetListBeersInteractorInput: AnyObject {

    func fetchBeers()
}

protocol GetListBeersInteractorOutput: AnyObject {

    func didGetBeers(_ beers: [Beer])
    func didFailToGetBeers(error: Error)
}

final class GetListBeersInteractor {

    weak var output: GetListBeersInteractorOutput?
}

// MARK: - UserInteractorInput

extension GetListBeersInteractor: GetListBeersInteractorInput {

    func fetchBeers() {
        let provider = MoyaProvider<BeerService>()
        provider.request(.list) { [weak output] result in
            switch result {
            case .success(let response):
                do {
                    let beers = try response.map([Beer].self)
                    output?.didGetBeers(beers)
                } catch let error {
                    output?.didFailToGetBeers(error: error)
                }
            case .failure(let error):
                output?.didFailToGetBeers(error: error)
            }
        }
    }
}
