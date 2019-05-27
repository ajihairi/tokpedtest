//
//  Shop.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class Shop: MirrorModel {
    
    fileprivate (set) var id = ""
    fileprivate (set) var name = ""
    fileprivate (set) var uri = ""
    fileprivate (set) var isGold = false
    fileprivate (set) var rating = ""
    fileprivate (set) var location = ""
    fileprivate (set) var reputationImageUri = ""
    fileprivate (set) var shopLucky = ""
    fileprivate (set) var city = ""
    
    convenience init(json: [String: Any]) {
        self.init()
        
        if let id = String.stringValueFromObject(json["id"]) {
            self.id = id
        }
        
        if let name = json["name"] as? String {
            self.name = name
        }
        
        if let uri = json["uri"] as? String {
            self.uri = uri
        }
        
        if let isGold = json["is_gold"] as? Bool {
            self.isGold = isGold
        }
        
        if let rating = json["rating"] as? String,
            rating != "null" {
            self.rating = rating
        }
        
        if let location = json["location"] as? String {
            self.location = location
        }
        
        if let reputationImageUri = json["reputation_image_uri"] as? String {
            self.reputationImageUri = reputationImageUri
        }
        
        if let shopLucky = json["shop_lucky"] as? String {
            self.shopLucky = shopLucky
        }
        
        if let city = json["city"] as? String {
            self.city = city
        }
    }
    
}
