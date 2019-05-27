//
//  StringExtension.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

extension String {
    static func stringValueFromObject(_ object: Any?) -> String? {
        if object == nil {
            return nil
        }
        
        if let obj = object as? NSNumber {
            return obj.stringValue
        }
        
        return object as? String
    }
}
