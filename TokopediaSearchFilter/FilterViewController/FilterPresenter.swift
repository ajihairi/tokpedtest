//
//  FilterPresenter.swift
//  TokopediaFilterFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class FilterPresenter: FilterModuleInterface, FilterInteractorOutput {
    
    unowned let view: FilterView
    unowned let wireframe: FilterWireframe
    var interactor: FilterInteractorInput?
    
    // MARK: - Initializer
    init(view: FilterView,
         wireframe: FilterWireframe) {
        
        self.view = view
        self.wireframe = wireframe
        
        interactor = FilterInteractor(output: self)
        
    }
    
    func presentShopTypeViewController(withDataSource dataSource: [String],
                                       delegate: ShopTypeViewControllerDelegate) {
        wireframe.presentShopTypeViewController(withDataSource: dataSource,
                                                delegate: delegate)
    }
}
