//
//  Constants.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-19.
//

import Foundation

struct Constants {
    static let publicApiKey = "ab9e2a6af11f95e5053441a94b30416f"
    static let privateApiKey = "80b00f28d13b8240b19e305ab02a3d3431dae5c2"
    static let currentTimeStamp = Date().timeStamp()
    static let hashValue = (Constants.currentTimeStamp + Constants.privateApiKey + Constants.publicApiKey).MD5()
}
