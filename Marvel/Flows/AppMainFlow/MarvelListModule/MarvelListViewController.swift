//
//  MarvelListViewController.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import UIKit

class MarvelListViewController: UIViewController, Presentable, StoryboardLoadable {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var copyRightsLabel: UILabel!

    var viewModel: MarvelListViewModel!
    var onMarvelItemTapped: ((CharacterDetails) -> Void)?
    private var cellHeight: CGFloat = 120

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(viewModel != nil, "ViewModel cannot be nil")
        configureViews()
        fetchMarvelCharacters()
    }

    func fetchMarvelCharacters() {
        showHUD()
        viewModel.fetchMarvelCharacters { [weak self] success, error in
            guard let self = self else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.hideHUD()
                guard success else {
                    print("error while fetching trips: \(error.debugDescription)")
                    return
                }
                self.collectionView.reloadData()
                self.copyRightsLabel.text = self.viewModel.copyRightsText
            }
        }
    }
}

// MARK: - Private Helper Methods
private extension MarvelListViewController {
    func configureViews() {
        collectionViewSetup()
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.tintColor = UIColor.white
    }

    func collectionViewSetup() {
        let cellNib = UINib(nibName: MarvelCell.cellNibName, bundle: nil)
        collectionView
            .register(cellNib,
                      forCellWithReuseIdentifier: MarvelCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDataSource
extension MarvelListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.nbOfCharacters
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: MarvelCell.cellIdentifier,
                                               for: indexPath) as? MarvelCell,
           let cellViewModel = viewModel.MarvelCellModel(at: indexPath) {
            cell.configure(viewModel: cellViewModel)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension MarvelListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentMarvel = viewModel.marvelCharacters[indexPath.item]
        onMarvelItemTapped?(currentMarvel)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == viewModel.nbOfCharacters - 1 {
            fetchMarvelCharacters()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MarvelListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.marvelCharacters[indexPath.item]
        let width = collectionView.bounds.width
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: Fonts.font(name: .font500, size: 15)]
        let estimatedFrame = NSString(string: item.description ?? "").boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return CGSize(width: width, height: estimatedFrame.height + cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
