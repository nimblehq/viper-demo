//
//  ListRepoUIFlows.swift
//  UITests
//
//  Created by Nguyen M. Tam on 13/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import Nimble
import XCTest 

extension XCUIApplication {

    private typealias Screen = ListRepos

    private class RepoCellInfo {
        let cell: XCUIElement
        let cellItem: RepoCellItem

        init(
            cell: XCUIElement,
            cellItem: RepoCellItem
        ) {
            self.cell = cell
            self.cellItem = cellItem
        }
    }

    @discardableResult
    func tapRepoCell(at index: Int) -> RepoCellItem {
        let info = getRepoCellInfo(at: index)
        info.cell.tap()
        return info.cellItem
    }

    func getRepoCellItem(at index: Int) -> RepoCellItem {
        return getRepoCellInfo(at: index).cellItem
    }

    private func getRepoCellInfo(at index: Int) -> RepoCellInfo {
        let table = tables[ListRepos.tableView.identifier].firstMatch
        let cell = table.cells.element(boundBy: index)

        /*
         Do not use this implementation:
         `let cell = tables[<identifier>].firstMatch.cells.allElementsBoundByIndex[<index>]`
         instead of this implementation:
         `let cell = tables[<identifier>].firstMatch.cells.element(boundBy: <index>)`
         Because there are some issues in the first way of implementation. The variable `allElementsBoundByIndex` immediately evaluates the query and returns an array of elements. This causes:
             + It may cause crashing app due to index out of bounds.
             + It is not designed for async matcher.
         */

        expect(table.exists && cell.exists && cell.isHittable)
            .toEventually(
                beTrue(),
                timeout: .long,
                description: "The cell at index \(index) of the table view \(identifier) is not available."
            )

        let repoFullName = cell.staticTexts.firstMatch.label
        let isBookmarked = cell.isSelected

        let cellItem = RepoCellItem(
            repoFullName: repoFullName,
            isBookmarked: isBookmarked
        )

        return RepoCellInfo(cell: cell, cellItem: cellItem)
    }
}
