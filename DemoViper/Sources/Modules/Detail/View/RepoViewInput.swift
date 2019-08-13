//
//  RepoViewInput.swift
//  DemoViper
//
//  Created by Su Van Ho on 13/8/19.
//  Copyright © 2019 Nimble Co. Ltd. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol RepoViewInput: AnyObject {
    func configure()
    func showViewItem(_ item: RepoItem)
    func showAvatar(_ data: Data)
}
