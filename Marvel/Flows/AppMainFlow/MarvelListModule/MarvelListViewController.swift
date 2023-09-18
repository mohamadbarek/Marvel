//
//  MarvelListViewController.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import UIKit

class MarvelListViewController: UIViewController, Presentable, StoryboardLoadable {

    var viewModel: MarvelListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "ViewModel cannot be nil")
    }
}
