//
//  ShopTypeWireframe.swift
//  TokopediaShopTypeFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

class ShopTypeWireframe {
    
    fileprivate var shopTypeVC: ShopTypeViewController
    fileprivate var presenter: ShopTypePresenter?
    
    init(withDataSource dataSource: [String],
         delegate: ShopTypeViewControllerDelegate) {
        shopTypeVC = ShopTypeViewController(withDataSource: dataSource,
                                            delegate: delegate)
        shopTypeVC.eventHandler = ShopTypePresenter(view: shopTypeVC,
                                                    wireframe: self)
    }
    
    func presentShopTypeViewControllerOn(_ viewController: UIViewController) {
        viewController.present(shopTypeVC,
                               animated: true,
                               completion: nil)
    }
}

