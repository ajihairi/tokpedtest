//
//  MirrorModel.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class MirrorModel: CustomStringConvertible {
    
    var description: String {
        return self.mirror()
    }
    
    func mirror() -> String {
        var description = ""
        
        let userMirror = Mirror(reflecting: self)
        
        for (name, value) in userMirror.children {
            guard let name = name else { continue }
            description += "\(name): \(type(of: value)) = '\(value)'\n"
        }
        
        return description
    }
}

