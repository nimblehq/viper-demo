//
//  ImageNetwork.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol ImageNetworkProtocol {
    func download(path: String, completion: @escaping (Result<Data, Error>) -> Void)
}

final class ImageNetwork {
    
    private let router: NetworkRouter<ImageTarget>
    
    static let `default`: ImageNetwork = {
        let router = NetworkRouter<ImageTarget>()
        return ImageNetwork(router: router)
    }()
    
    init(router: NetworkRouter<ImageTarget>) {
        self.router = router
    }
}

// MARK: - RepoNetworkProtocol
extension ImageNetwork: ImageNetworkProtocol {
    func download(path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        router.request(.download(path), completion: completion)
    }
}
