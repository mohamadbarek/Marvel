//
//  Array+PrefixSafe.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-21.
//

import UIKit

extension Array {
    func prefixSafe(_ maxLength: Int) -> [Element] {
        let safeLength = Swift.min(maxLength, count)
        return Array(prefix(safeLength))
    }
}
