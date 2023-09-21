//
//  MarvelListViewModel.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import Foundation

class MarvelListViewModel {

    typealias Dependencies = HasNetworkService & HasUserDefaultsService
    private let dependencies: Dependencies

    private var offset = 0
    private let limit = 20
    private var totalCharacters: Int = 0
    var copyRightsText: String = ""

    var marvelCharacters = [CharacterDetails]()

    var nbOfCharacters: Int {
        return marvelCharacters.count
    }

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}


// MARK: - Network calls
extension MarvelListViewModel {
    func fetchMarvelCharacters(completion: @escaping ((Bool, Error?) -> Void)) {
        if offset >= totalCharacters && totalCharacters != 0 {
            completion(true, nil)
            return
        }
        DispatchQueue.global(qos: .background).async {
            self.dependencies.networkService.getMarvelCharacters(offset: self.offset, limit: self.limit) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let marvelCharacters):
                    self.totalCharacters = marvelCharacters.data?.total ?? 0
                    self.copyRightsText = marvelCharacters.attributionText ?? ""
                    self.dependencies.userDefaultsService.setMarvelCopyright(self.copyRightsText)
                    if let newResults = marvelCharacters.data?.results {
                        self.marvelCharacters.append(contentsOf: newResults)
                    }
                    self.offset += self.limit
                    print(marvelCharacters)
                    completion(true, nil)
                case .failure(let error):
                    print(error)
                    completion(false, error)
                }
            }
        }
    }
}

// MARK: - Helper Methods
extension MarvelListViewModel {
    func MarvelCellModel(at index: IndexPath) -> MarvelViewModel? {
        guard index.row < marvelCharacters.count else { return nil }
        let item = marvelCharacters[index.row]
        return MarvelViewModel(marvel: item)
    }
}
