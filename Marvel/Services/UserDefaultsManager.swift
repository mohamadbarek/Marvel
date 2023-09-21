//
//  UserDefaultsManager.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import Foundation

final class UserDefaultsService: UserDefaultsProtocol {
    private let defaults = UserDefaults.standard
    private let copyRightKey = "MarvelCopyright"

    var marvelCopyright: String? {
        get {
            return defaults.string(forKey: copyRightKey)
        }
        set {
            defaults.setValue(newValue, forKey: copyRightKey)
        }
    }

    func setMarvelCopyright(_ text: String) {
        defaults.setValue(text, forKey: copyRightKey)
    }
}
