//
//  UserDefaultsProtocol.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import Foundation

protocol UserDefaultsProtocol {
    var marvelCopyright: String? { get }
    func setMarvelCopyright(_ text: String)
}
