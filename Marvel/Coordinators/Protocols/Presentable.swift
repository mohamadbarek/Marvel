//
//  Presentable.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-18.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension Presentable where Self: UIViewController {
    func toPresent() -> UIViewController {
        return self
    }
}
