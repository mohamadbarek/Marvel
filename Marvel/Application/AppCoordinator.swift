//
//  AppCoordinator.swift
//  marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let dependencyProvider: DependencyProvider
    private let moduleFactory: AppModuleFactoryType

    init(router: RouterType,
         moduleFactory: AppModuleFactoryType) {
        self.dependencyProvider = DependencyProvider()
        self.moduleFactory = moduleFactory
        super.init(router: router)
    }

    override init(router: RouterType) {
        self.dependencyProvider = DependencyProvider()
        self.moduleFactory = AppModuleFactory()
        super.init(router: router)
    }

    override func start() {
        showMarvelListModule()
    }
}

// MARK: - Private helper methods
private extension AppCoordinator {
    func showMarvelListModule() {
        let marvelListViewController = moduleFactory.makeMarvelListModule(dependencies: dependencyProvider)
        marvelListViewController.onMarvelItemTapped = { [weak self] marvelDetails in
            self?.showMarvelDetailsScreen(marvelCharacter: marvelDetails)
        }
        router.setRootModule(marvelListViewController, hideBar: false)
    }

    func showMarvelDetailsScreen(marvelCharacter: CharacterDetails) {
        let marvelDetailsViewController = moduleFactory.makeMarvelDetailstModule(dependencies: dependencyProvider, marvelCharacter: marvelCharacter)
        router.push(marvelDetailsViewController, animated: true, completion: nil)
    }
}
