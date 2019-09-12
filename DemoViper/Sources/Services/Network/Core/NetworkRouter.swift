//
//  NetworkRouter.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

protocol NetworkRoutable: class {
    associatedtype Target: TargetType
    func request(_ target: Target, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkRouter<Target: TargetType>: NetworkRoutable {
    func request(_ target: Target, completion: @escaping (Result<Data, Error>) -> Void) {
        let path = target.baseURL + target.path
        guard let url = URL(string: path) else {
            return completion(.failure(NetworkError.url))
        }
        switch target.task {
        case .request:
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async(execute: {
                    if let error = error {
                        return completion(.failure(error))
                    }
                    guard response != nil, let data = data else {
                        return completion(.failure(NetworkError.empty))
                    }
                    completion(.success(data))
                })
            }.resume()
        }
    }
}
