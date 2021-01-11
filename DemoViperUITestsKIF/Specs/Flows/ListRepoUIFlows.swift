//
//  ListRepoUIFlows.swift
//  UITestsKIF
//
//  Created by Nguyen M. Tam on 12/01/2021.
//  Copyright © 2021 Nimble Co. Ltd. All rights reserved.
//

import KIF

extension KIFTestActor {

    private typealias Screen = ListRepos

    @discardableResult
    func tapRepoCell(at index: Int) -> RepoCellItem? {
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = tester().tapCell(at: indexPath, inTableView: ListRepos.tableView.identifier) else {
            return nil
        }
        return RepoCellItem(
            repoFullName: cell.textLabel?.text ?? "",
            isBookmarked: cell.accessoryType == .checkmark
        )
    }

    func getRepoCellItem(at index: Int) -> RepoCellItem? {
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = tester().getCell(at: indexPath, inTableView: ListRepos.tableView.identifier)
        else { return nil }
        return RepoCellItem(
            repoFullName: cell.textLabel?.text ?? "",
            isBookmarked: cell.accessoryType == .checkmark
        )
    }
}
