//
//  ReposInteractorSpec.swift
//  DemoViper Tests
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class ReposInteractorSpec: QuickSpec {

    override func spec() { 

        var interactor: ReposInteractor!
        var output: ReposInteractorOutputMock!
        var service: RepoNetworkProtocolMock!
        let repo1 = RepoInstance.repo1
        let repo2 = RepoInstance.repo2

        describe("a Repos interactor") { 

            beforeEach {
                output = ReposInteractorOutputMock()
                service = RepoNetworkProtocolMock()
                interactor = ReposInteractor(service: service)
                interactor.output = output
            }

            context("when getRepos() is called and returns successfully") {

                let repos = [repo1, repo2]

                beforeEach {
                    service.listCompletionClosure = { callback in
                        callback(.success(repos))
                    }
                    interactor.getRepos()
                }

                it("checks repos fullname") {
                    let reposFullname = output.didSuccessWithReceivedRepos?.compactMap { $0.fullName }
                    expect(reposFullname) == repos.map { $0.fullName }
                }

                context("when getRepo(at:) is called") {

                    var repoID: Int?

                    beforeEach {
                        repoID = interactor.getRepo(at: 0)?.id
                    }

                    it("checks repo id") {
                        expect(repoID) == 1
                    }
                }
            }

            context("when getRepos() is called and returns failed") {

                let error = NetworkError.json

                beforeEach {
                    service.listCompletionClosure = { callback in
                        callback(.failure(error))
                    }
                    interactor.getRepos()
                }

                it("checks the description") {
                    expect(output.didFailWithReceivedError?.localizedDescription) == error.localizedDescription
                }
            }
        }
    }
}
