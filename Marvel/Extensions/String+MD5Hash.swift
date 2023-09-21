//
//  String+MD5Hash.swift
//  Marvel
//
//  Created by MohammadBarek on 2023-09-19.
//

import Foundation
import CryptoKit

extension String {
    func MD5() -> String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
