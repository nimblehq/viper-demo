//
//  RepoInstances.swift
//  DemoViperTests
//
//  Created by Nguyen M. Tam on 4/27/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Foundation

@testable import DemoViper

enum RepoInstance {
    
    static let repo1 = Repo(from: """
                    {"id": 1, "name": "repoName1", "fullName": "repoFullName1"}
                    """)!
    static let repo2 = Repo(from: """
                    {"id": 2, "name": "repoName2", "fullName": "repoFullName2"}
                    """)!
    static let repo8 = Repo(from: """
                    {"id": 8, "name": "repoName8", "fullName": "repoFullName8"}
                    """)!
}
