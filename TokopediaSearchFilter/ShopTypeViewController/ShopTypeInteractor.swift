//
//  ShopTypeInteractor.swift
//  TokopediaShopTypeFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class ShopTypeInteractor: ShopTypeInteractorInput {
    unowned let output: ShopTypeInteractorOutput
    
    init(output: ShopTypeInteractorOutput) {
        self.output = output
    }
}

