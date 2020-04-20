//
//  ReposPresenterSpec.swift
//  DemoViper Tests
//
//  Created by Nguyen M. Tam on 4/20/20.
//  Copyright © 2020 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

@testable import DemoViper

final class ReposPresenterSpec: QuickSpec {

    override func spec() { 

        var presenter: ReposPresenter!
        var router: ReposRouterInputMock!
        var interactor: ReposInteractorInputMock!
        var view: ReposViewInputMock!
        var output: ReposOutputMock!
        let repo1 = Repo(from: """
                        {"id": 1, "name": "repoName1", "fullName": "repoFullName1"}
                        """)!
        let repo2 = Repo(from: """
                        {"id": 2, "name": "repoName2", "fullName": "repoFullName2"}
                        """)!

        describe("a Repos presenter") { 

            beforeEach { 
                router = ReposRouterInputMock()
                router.detailWithReturnValue = RepoModule()
                interactor = ReposInteractorInputMock()
                interactor.getRepoAtReturnValue = Repo(from: """
                                                {"id": 8, "name": "repoName8", "fullName": "repoFullName8"}
                                                """)!
                view = ReposViewInputMock()
                presenter = ReposPresenter()
                output = ReposOutputMock()
                presenter.output = output
                presenter.router = router
                presenter.interactor = interactor
                presenter.view = view
            }
            
            context("when viewDidLoad is called") {

                beforeEach { 
                    presenter.viewDidLoad()
                }
                
                it("calls view to configure view") { 
                    expect(view.configureCalled) == true
                }

                it("calls interactor to get repos") {
                    expect(interactor.getReposCalled) == true
                }
            }

            context("when detail(at:) is called") {

                beforeEach {
                    presenter.detail(at: 0)
                }

                it("calls interactor to get repo ID") {
                    expect(interactor.getRepoAtCalled) == true
                }

                it("calls router to show detail") {
                    expect(router.detailWithCalled) == true
                    expect(router.detailWithReceivedId) == 8
                }
            }

            context("when didSuccess(with:) is called with empty list of repos") {

                beforeEach {
                    presenter.didSuccess(with: [])
                }

                it("calls view to show empty message") {
                    expect(view.showEmptyMessageCalled) == true
                }
            }

            context("when didSuccess(with:) is called with non empty list of repos") {

                let repos = [repo1, repo2]

                beforeEach {
                    presenter.didSuccess(with: repos)
                }

                it("calls view to show data") {
                    let data = view.showDataReceivedData?.compactMap {$0.title}
                    expect(data) == repos.compactMap { "@" + $0.fullName }
                }
            }

            context("when didFail(with:) is called") {

                let error = NetworkError.json

                beforeEach {
                    presenter.didFail(with: error)
                }

                it("calls view to show empty message") {
                    expect(view.showEmptyMessageCalled) == true
                }

                it("calls router to show error message") {
                    expect(router.showErrorReceivedError?.localizedDescription) == error.localizedDescription
                }
            }
        }
    }
}
