//
//  FilterWireframe.swift
//  TokopediaFilterFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

class FilterWireframe {
    
    fileprivate var filterVC: FilterViewController
    fileprivate var shopTypeWireframe: ShopTypeWireframe?
    
    init(withModel model: FilterProductModel,
         delegate: FilterViewControllerDelegate) {
        filterVC = FilterViewController(withModel: model, delegate: delegate)
        filterVC.eventHandler = FilterPresenter(view: filterVC,
                                                wireframe: self)
    }
    
    func presentFilterViewControllerOn(_ viewController: UIViewController) {
        viewController.present(filterVC,
                               animated: true,
                               completion: nil)
    }
    
    func presentShopTypeViewController(withDataSource dataSource: [String],
                                       delegate: ShopTypeViewControllerDelegate) {
        shopTypeWireframe = ShopTypeWireframe(withDataSource: dataSource,
                                              delegate: delegate)
        shopTypeWireframe?.presentShopTypeViewControllerOn(filterVC)
    }
}

