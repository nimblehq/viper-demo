//
//  ListReposSpecs.swift
//  DemoViperUITestsKIF
//
//  Created by Nguyen M. Tam on 07/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble
import KIF

@testable import DemoViper

final class ListReposUITests: QuickSpec {

    override func spec() {

        let tester = self.tester()

        describe("list repos") {

            beforeEach {
                setUpTestEnvironment()
                self.setUpSpec()
            }

            it("open the list repo screen successfully") {
               let view = tester.waitForView(withAccessibilityLabel: ListRepos.view.identifier)
                expect(view).notTo(beNil())
            }

            context("no repo is added to bookmark") {

                it("verify initial data of a repo and open the detail repo screen") {
                    let repoCellItem = tester.tapRepoCell(at: 0)
                    expect(repoCellItem?.repoFullName) != ""
                    expect(repoCellItem?.isBookmarked) == false

                    let view = tester.waitForView(withAccessibilityLabel: DetailRepo.view.identifier)
                    expect(view).notTo(beNil())
                }

                it("navigate back to the list repos screen and verify the repo item is not bookmarked") {
                    tester.tapRepoCell(at: 1)
                    tester.tapBackButton(onScreen: DetailRepo.view.identifier)

                    let view = tester.waitForView(withAccessibilityLabel: ListRepos.view.identifier)
                     expect(view).notTo(beNil())

                    let repoCellItem = tester.getRepoCellItem(at: 1)
                    expect(repoCellItem?.repoFullName) != ""
                    expect(repoCellItem?.isBookmarked) == false
                }
            }

            context("a repo is added to bookmark") {

                it("verify initial data of a repo and open the detail repo screen") {
                    let repoCellItem = tester.tapRepoCell(at: 2)
                    expect(repoCellItem?.repoFullName) != ""
                    expect(repoCellItem?.isBookmarked) == false

                    let view = tester.waitForView(withAccessibilityLabel: DetailRepo.view.identifier)
                    expect(view).notTo(beNil())
                }

                it("navigate back to the list repos screen and verify the repo item is bookmarked") {
                    tester.tapRepoCell(at: 3)
                    tester.tapBookmarkButton()
                    tester.tapBackButton(onScreen: DetailRepo.view.identifier)

                    let view = tester.waitForView(withAccessibilityLabel: ListRepos.view.identifier)
                     expect(view).notTo(beNil())

                    let repoCellItem = tester.getRepoCellItem(at: 3)
                    expect(repoCellItem?.repoFullName) != ""
                    expect(repoCellItem?.isBookmarked) == true
                }
            }

            afterEach {
                tester.resetToRootScreen()
            }
        }
    }
}
