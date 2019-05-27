//
//  SearchWireframe.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation
import UIKit

class SearchWireframe {
    
    let searchVC: SearchViewController
    fileprivate var filterWireframe: FilterWireframe?
    
    init() {
        searchVC = SearchViewController()
        searchVC.eventHandler = SearchPresenter(view: searchVC,
                                                wireframe: self)
    }
    
    func presentFilterViewController(withModel model: FilterProductModel,
                                     delegate: FilterViewControllerDelegate) {
        filterWireframe = FilterWireframe(withModel: model, delegate: delegate)
        filterWireframe?.presentFilterViewControllerOn(searchVC)
    }
}
