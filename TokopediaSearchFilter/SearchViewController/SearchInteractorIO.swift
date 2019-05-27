//
//  SearchInteractorIO.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

protocol SearchInteractorInput: class {
    
    func requestProduct(model: RequestProductModel)
    
    func requestMoreProduct(model: RequestProductModel)
    
}

protocol SearchInteractorOutput: class {
    
    func responseProduct(products: [Product])
    
    func responseMoreProduct(products: [Product])
    
}
