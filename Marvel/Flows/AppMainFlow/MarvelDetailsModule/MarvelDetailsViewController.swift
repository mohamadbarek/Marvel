//
//  MarvelDetailsViewController.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import UIKit

class MarvelDetailsViewController: UIViewController, Presentable, StoryboardLoadable {

    @IBOutlet private weak var copyRightsLabel: UILabel!
    @IBOutlet private weak var characterIdLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: MarvelDetailsViewModel!
    private let rowHeight: CGFloat = 50
    private let sectionHeader = "sectionHeader"

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
}

// MARK: - Private Helper Methods
private extension MarvelDetailsViewController {
    func configureViews() {
        configureTableView()
        copyRightsLabel.text = viewModel.copyrightText
        characterIdLabel.text = "Character id: \(viewModel.id)"
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(MarvelDetailsSectionHeader.self, forHeaderFooterViewReuseIdentifier: sectionHeader)
        tableView.register(UINib(nibName: MarvelDetailsCell.cellNibName, bundle: .main),
                           forCellReuseIdentifier: MarvelDetailsCell.cellIdentifier)
    }
}

// MARK: - UITableViewDataSource
extension MarvelDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.availableSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = viewModel.availableSections[section]
        return viewModel.items(for: sectionType).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarvelDetailsCell.cellIdentifier, for: indexPath) as! MarvelDetailsCell
        cell.selectionStyle = .none
        let sectionType = viewModel.availableSections[indexPath.section]
        let items = viewModel.items(for: sectionType)
        cell.configure(with: items[indexPath.row].name ?? "")
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MarvelDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeader) as! MarvelDetailsSectionHeader
        let sectionType = viewModel.availableSections[section]
        headerView.titleLabel.text = viewModel.title(for: sectionType)
        headerView.titleLabel.textColor = .appSecondaryColor
        return headerView
    }
}
