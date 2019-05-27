//
//  SearchModuleInterface.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

protocol SearchModuleInterface {
    
    func requestProduct(model: RequestProductModel)
    
    func requestMoreProduct(model: RequestProductModel)
    
    func presentFilterViewController(model: FilterProductModel,
                                     delegate: FilterViewControllerDelegate)
    
}
