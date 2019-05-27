//
//  SearchInteractor.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInput {
    unowned let output: SearchInteractorOutput
    
    init(output: SearchInteractorOutput) {
        self.output = output
    }
    
    func requestProduct(model: RequestProductModel) {
        
        ServiceManager.shared.requestProduct(withRequestProductModel: model, onSuccess: { [weak self] (response) in
            
            if let responseData = response["data"] as? [String: Any],
                let data = responseData["data"] as? [[String: Any]] {
                
                var products = [Product]()
                
                for product in data {
                    
                    let newProduct = Product(json: product)
                    products.append(newProduct)
                    
                }
                
                self?.output.responseProduct(products: products)
                
            }
            
        }) { (error) in
            
            debugPrint("error", error)

            
        }
        
    }
    
    func requestMoreProduct(model: RequestProductModel) {
        
        ServiceManager.shared.requestProduct(withRequestProductModel: model, onSuccess: { [weak self] (response) in
            
            if let responseData = response["data"] as? [String: Any],
                let data = responseData["data"] as? [[String: Any]] {
                
                var products = [Product]()
                
                for product in data {
                    
                    let newProduct = Product(json: product)
                    products.append(newProduct)
                    
                }
                
                self?.output.responseMoreProduct(products: products)
                
            }
            
        }) { (error) in
            
            debugPrint("error", error)
            
            
        }
        
    }
}
