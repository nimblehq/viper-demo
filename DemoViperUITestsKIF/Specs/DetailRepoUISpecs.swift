//
//  DetailRepoUISpecs.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Quick
import Nimble
import KIF

@testable import DemoViper

final class DetailRepoUISpecs: QuickSpec {

    override func spec() {

        let tester = self.tester()

        describe("list repos") {

            beforeEach {
                setUpTestEnvironment()
                self.continueAfterFailure = true
                tester.waitForView(withAccessibilityLabel: ListRepos.view.identifier)
                tester.tapRepoCell(at: 0)
            }

            it("open the detail repo screen successfully") {
                let view = tester.waitForView(withAccessibilityLabel: DetailRepo.view.identifier)
                expect(view).notTo(beNil())
            }

            context("no repo is added to bookmark") {

                it("verify initial data the detail repo screen") {
                    let bookmarkButton = tester.waitForView(
                        withAccessibilityLabel: General.bookmarkButton.identifier,
                        traits: .button
                    )
                    expect(bookmarkButton).notTo(beNil())
                }
            }

            context("a repo is added to bookmark") {

                it("verify initial data the detail repo screen") {
                    tester.tapBookmarkButton()

                    let bookmarkButton = tester.waitForView(
                        withAccessibilityLabel: General.bookmarkButton.identifier,
                        traits: .notEnabled
                    )
                    expect(bookmarkButton).notTo(beNil())
                }
            }

            context("open the web page of the repo") {

                it("verify opening web page with safari") {
                    tester.waitAndTapView(with: DetailRepo.authorView.identifier)

                    /*
                    // Test opening a url with a browser
                    tester.system().waitForApplication(
                        toOpenURL: "https://github.com/mojombo",
                        whileExecuting: {
                            tester.waitAndTapView(with: DetailRepo.authorView.identifier)
                        },
                        returning: true
                    )
                     */

                    let view = tester.waitForView(withAccessibilityLabel: General.webview.identifier)
                    expect(view?.accessibilityValue) == "https://github.com/mojombo"
                }
            }

            afterEach {
                tester.resetToRootScreen()
            }
        }
    }
}
