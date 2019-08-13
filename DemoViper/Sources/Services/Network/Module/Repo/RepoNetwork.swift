//
//  RepoNetwork.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol RepoNetworkProtocol {
    func list(completion: @escaping (Result<[Repo], Error>) -> Void)
    func info(id: Int, completion: @escaping (Result<Info, Error>) -> Void)
}

final class RepoNetwork {
    
    private let router: NetworkRouter<RepoTarget>
    
    static let `default`: RepoNetwork = {
        let router = NetworkRouter<RepoTarget>()
        return RepoNetwork(router: router)
    }()
    
    init(router: NetworkRouter<RepoTarget>) {
        self.router = router
    }
}

// MARK: - RepoNetworkProtocol
extension RepoNetwork: RepoNetworkProtocol {
    func list(completion: @escaping (Result<[Repo], Error>) -> Void) {
        router.request(.list) { result in
            switch result {
            case .success(let data):
                guard let repos: [Repo] = try? data.map([Repo].self) else {
                    return completion(.failure(NetworkError.json))
                }
                completion(.success(repos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func info(id: Int, completion: @escaping (Result<Info, Error>) -> Void) {
        router.request(.info(id)) { result in
            switch result {
            case .success(let data):
                guard let info: Info = try? data.map(Info.self) else {
                    completion(.failure(NetworkError.json))
                    return
                }
                completion(.success(info))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
