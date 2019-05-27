//
//  WholesalePrice.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class WholesalePrice: MirrorModel {
    
    fileprivate (set) var countMin = 0
    fileprivate (set) var countMax = 0
    fileprivate (set) var price = ""
    
    convenience init(json: [String: Any]) {
        
        self.init()
        
        if let countMin = json["count_min"] as? Int {
            self.countMin = countMin
        }
        
        if let countMax = json["count_max"] as? Int {
            self.countMax = countMax
        }
        
        if let price = json["price"] as? String {
            self.price = price
        }
        
    }
}
