//
//  ShopTypePresenter.swift
//  TokopediaShopTypeFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class ShopTypePresenter: ShopTypeModuleInterface, ShopTypeInteractorOutput {
    
    unowned let view: ShopTypeView
    unowned let wireframe: ShopTypeWireframe
    var interactor: ShopTypeInteractorInput?
    
    // MARK: - Initializer
    init(view: ShopTypeView,
         wireframe: ShopTypeWireframe) {
        
        self.view = view
        self.wireframe = wireframe
        
        interactor = ShopTypeInteractor(output: self)
        
    }
}

