//
//  Date+TimeStamp.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-19.
//

import Foundation

extension Date {
    func timeStamp() -> String {
        return "\(Int(self.timeIntervalSince1970))"
    }
}
