//
//  RepoViewInput.swift
//  viper
//
//  Created by Su Van Ho on 12/8/19.
//  Copyright © 2019 Nimble. All rights reserved.
//

import Foundation

protocol RepoViewInput: class {
    func showViewItem(_ item: RepoItem)
    func showAvatar(_ data: Data)
}
