//
//  Product.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class Product: MirrorModel {
    
    fileprivate (set) var id = ""
    fileprivate (set) var name = ""
    fileprivate (set) var uri = ""
    fileprivate (set) var imageUri = ""
    fileprivate (set) var imageUri700 = ""
    fileprivate (set) var price = ""
    fileprivate (set) var shop: Shop?
    fileprivate (set) var wholesalePrice = [WholesalePrice]()
    fileprivate (set) var condition = 0
    fileprivate (set) var preorder = 0
    fileprivate (set) var departmentId = 0
    fileprivate (set) var rating = 0
    fileprivate (set) var isFeatured = false
    fileprivate (set) var countReview = 0
    fileprivate (set) var countTalk = 0
    fileprivate (set) var countSold = 0
    fileprivate (set) var labels = [Label]()
    fileprivate (set) var badges = [Badge]()
    fileprivate (set) var originalPrice = ""
    fileprivate (set) var discountExpired = ""
    fileprivate (set) var discountPercentage = 0
    
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
        
        if let imageUri = json["image_uri"] as? String {
            self.imageUri = imageUri
        }
        
        if let imageUri700 = json["image_uri_700"] as? String {
            self.imageUri700 = imageUri700
        }
        
        if let price = json["price"] as? String {
            self.price = price
        }
        
        if let shop = json["shop"] as? [String: Any] {
            self.shop = Shop(json: shop)
        }
        
        if let wholesalePrices = json["wholesale_price"] as? [[String: Any]] {
            
            for wholesalePrice in wholesalePrices {
                
                let newWholesalePrice = WholesalePrice(json: wholesalePrice)
                self.wholesalePrice.append(newWholesalePrice)
                
            }
            
        }
        
        if let condition = json["condition"] as? Int {
            self.condition = condition
        }
        
        if let preorder = json["preorder"] as? Int {
            self.preorder = preorder
        }
        
        if let departmentId = json["department_id"] as? Int {
            self.departmentId = departmentId
        }
        
        if let isFeatured = json["is_featured"] as? Bool {
            self.isFeatured = isFeatured
        }
        
        if let countReview = json["count_review"] as? Int {
            self.countReview = countReview
        }
        
        if let countTalk = json["count_talk"] as? Int {
            self.countTalk = countTalk
        }
        
        if let countSold = json["count_sold"] as? Int {
            self.countSold = countSold
        }
        
        if let labels = json["labels"] as? [[String: Any]] {
            
            for label in labels {
                
                let newLabel = Label(json: label)
                self.labels.append(newLabel)
                
            }
            
        }
        
        if let badges = json["badges"] as? [[String: Any]] {
            
            for badge in badges {
                
                let newBadge = Badge(json: badge)
                self.badges.append(newBadge)
                
            }
            
        }
        
        if let originalPrice = json["original_price"] as? String {
            self.originalPrice = originalPrice
        }
        
        if let discountExpired = json["discount_expired"] as? String,
            discountExpired != "null" {
            self.discountExpired = discountExpired
        }
        
        if let discountPercentage = json["discount_percentage"] as? Int {
            self.discountPercentage = discountPercentage
        }
        
    }
    
}


