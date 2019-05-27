//
//  Label.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class Label: MirrorModel {
    
    fileprivate (set) var title = ""
    fileprivate (set) var color = ""
    
    convenience init(json: [String: Any]) {
        
        self.init()
        
        if let title = json["title"] as? String {
            self.title = title
        }
        
        if let color = json["color"] as? String {
            self.color = color
        }
        
    }
}
