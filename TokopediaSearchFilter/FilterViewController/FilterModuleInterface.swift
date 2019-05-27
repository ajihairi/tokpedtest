//
//  FilterModuleInterface.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

protocol FilterModuleInterface {
    
    func presentShopTypeViewController(withDataSource dataSource: [String],
                                       delegate: ShopTypeViewControllerDelegate)

}
