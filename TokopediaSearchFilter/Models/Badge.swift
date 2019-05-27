//
//  Badge.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class Badge: MirrorModel {
    
    fileprivate (set) var title = ""
    fileprivate (set) var imageUrl = ""
    
    convenience init(json: [String: Any]) {
        
        self.init()
        
        if let title = json["title"] as? String {
            self.title = title
        }
        
        if let imageUrl = json["image_url"] as? String {
            self.imageUrl = imageUrl
        }
        
    }
}
