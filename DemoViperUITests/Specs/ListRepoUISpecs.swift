//
//  ListRepoUISpecs.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble

final class ListRepoUISpecs: QuickSpec {

    override func spec() {

        var application: XCUIApplication!

        describe("list repos") {

            beforeEach {
                self.setUpSpec()
                application = setUpTestEnvironment()
                application.launch()
            }

            it("open the list repo screen successfully") {
                let view = application.views[ListRepos.view.identifier]
                /*
                 Note: Not use this function for finding a view
                let view = application.otherElements[ListRepos.view.identifier]
                 */
                expect(view.exists).toEventually(beTrue(),timeout: .medium)
            }

            context("no repo is added to bookmark") {

                it("verify initial data of a repo and open the detail repo screen") {
                    let repoCellItem = application.tapRepoCell(at: 0)

                    expect(repoCellItem.repoFullName).toEventuallyNot(beEmpty(), timeout: .medium)
                    expect(repoCellItem.isBookmarked).toEventually(beFalse(),timeout: .medium)

                    let view = application.views[DetailRepo.view.identifier]
                    expect(view.exists).toEventually(beTrue(),timeout: .medium)
                }

                it("navigate back to the list repos screen and verify the repo item is not bookmarked") {
                    application.tapRepoCell(at: 1)
                    application.tapBackButton(onScreen: DetailRepo.view.identifier)

                    let view = application.views[ListRepos.view.identifier]
                    expect(view.exists).toEventually(beTrue(),timeout: .medium)

                    let repoCellItem = application.getRepoCellItem(at: 1)
                    expect(repoCellItem.repoFullName).toEventuallyNot(beEmpty(), timeout: .medium)
                    expect(repoCellItem.isBookmarked).toEventually(beFalse(),timeout: .medium)
                }
            }

            context("a repo is added to bookmark") {

                it("verify initial data of a repo and open the detail repo screen") {
                    let repoCellItem = application.tapRepoCell(at: 2)
                    expect(repoCellItem.repoFullName).toEventuallyNot(beEmpty(), timeout: .medium)
                    expect(repoCellItem.isBookmarked).toEventually(beFalse(),timeout: .medium)

                    let view = application.views[DetailRepo.view.identifier]
                    expect(view.exists).toEventually(beTrue(),timeout: .medium)
                }

                it("navigate back to the list repos screen and verify the repo item is bookmarked") {
                    application.tapRepoCell(at: 3)
                    application.tapBookmarkButton()
                    application.tapBackButton(onScreen: DetailRepo.view.identifier)

                    let view = application.views[ListRepos.view.identifier]
                    expect(view.exists).toEventually(beTrue(),timeout: .medium)

                    let repoCellItem = application.getRepoCellItem(at: 3)
                    expect(repoCellItem.repoFullName).toEventuallyNot(beEmpty(), timeout: .medium)
                    expect(repoCellItem.isBookmarked).toEventually(beTrue(),timeout: .medium)
                }
            }

            afterEach {
                application.terminate()
            }
        }
    }
}
