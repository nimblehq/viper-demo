//
//  Network.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

final class Network {
    func repoNetwork() -> RepoNetwork {
        return RepoNetwork.default
    }

    func imageNetwork() -> ImageNetwork {
        return ImageNetwork.default
    }
}
