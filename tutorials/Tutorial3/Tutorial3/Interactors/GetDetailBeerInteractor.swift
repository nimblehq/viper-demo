//
//  GetDetailBeerInteractor.swift
//  Tutorial3
//
//  Created by Su Van Ho on 24/05/2021.
//  
//

import Moya

protocol GetDetailBeerInteractorInput: AnyObject {

    func getBeer(with id: Int)
}

protocol GetDetailBeerInteractorOutput: AnyObject {

    func didGetBeer(_ beer: Beer)
    func didFailToGetBeer(error: Error)
}

final class GetDetailBeerInteractor {

    weak var output: GetDetailBeerInteractorOutput?
}

// MARK: - GetDetailBeerInteractorInput

extension GetDetailBeerInteractor: GetDetailBeerInteractorInput {

    func getBeer(with id: Int) {
        let provider = MoyaProvider<BeerService>()
        provider.request(.detail(id: id)) { [weak output] result in
            switch result {
            case .success(let response):
                do {
                    let beers = try response.map([Beer].self)
                    guard let beer = beers.first else {
                        throw NSError(domain: "Empty Object", code: -999, userInfo: nil)
                    }
                    output?.didGetBeer(beer)
                } catch let error {
                    output?.didFailToGetBeer(error: error)
                }
            case .failure(let error):
                output?.didFailToGetBeer(error: error)
            }
        }
    }
}
