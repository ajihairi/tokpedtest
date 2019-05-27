//
//  FloatExtensions.swift
//  TokopediaSearchFilter
//
//  Created by Managam Silalahi on 08/02/18.
//  Copyright © 2018 Managam Silalahi. All rights reserved.
//

import Foundation

extension Float {
    var clean: String {
        return self % 1 == 0 ? String(format: "%.0f", self) : String(self)
    }
}
