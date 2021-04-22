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
    private let mapper: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
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
        router.request(.list) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    let repos: [Repo] = try self.mapper.decode([Repo].self, from: data)
                    completion(.success(repos))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func info(id: Int, completion: @escaping (Result<Info, Error>) -> Void) {
        router.request(.info(id)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                do {
                    let info: Info = try self.mapper.decode(Info.self, from: data)
                    completion(.success(info))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
