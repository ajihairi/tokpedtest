//
//  SearchPresenter.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class SearchPresenter: SearchModuleInterface, SearchInteractorOutput {
    
    unowned let view: SearchView
    unowned let wireframe: SearchWireframe
    var interactor: SearchInteractorInput?

    // MARK: - Initializer
    init(view: SearchView,
         wireframe: SearchWireframe) {
        
        self.view = view
        self.wireframe = wireframe
        
        interactor = SearchInteractor(output: self)
        
    }
    
    func requestProduct(model: RequestProductModel) {
        interactor?.requestProduct(model: model)
    }
    
    func requestMoreProduct(model: RequestProductModel) {
        interactor?.requestMoreProduct(model: model)
    }
    
    func responseProduct(products: [Product]) {
        view.responseProduct(products: products)
    }
    
    func responseMoreProduct(products: [Product]) {
        view.responseMoreProduct(products: products)
    }
    
    func presentFilterViewController(model: FilterProductModel,
                                     delegate: FilterViewControllerDelegate) {
        wireframe.presentFilterViewController(withModel: model, delegate: delegate)
    }
}
