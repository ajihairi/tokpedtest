//
//  SearchViewController.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

private enum Constants {
    static let Title = "Search"
    static let LoadMoreProduct = 10
}

class SearchViewController: UIViewController, SearchView {
    
    var eventHandler: SearchModuleInterface?
    fileprivate var model = RequestProductModel.defaultRequest()
    fileprivate var products = [Product]()
    
    @IBOutlet weak var productCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = Constants.Title
        self.loadNibs()
        self.requestProduct()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func loadNibs() {
        productCollectionView.register(ProductCollectionViewCell.self)
        productCollectionView.register(LoadingCollectionViewCell.self)
    }
    
    fileprivate func requestProduct() {
        eventHandler?.requestProduct(model: model)
    }
    
    func responseProduct(products: [Product]) {
        self.products = products
        self.productCollectionView.reloadData()
    }
    
    func responseMoreProduct(products: [Product]) {
        self.products.append(contentsOf: products)
        self.productCollectionView.reloadData()
    }
    
    // MARK: - IBActions
    
    @IBAction func filterButtonDidClicked(_ sender: UIButton) {
        let filterModel = FilterProductModel(keyword: model.q,
                                             pmin: model.pmin,
                                             pmax: model.pmax,
                                             wholesale: model.wholesale,
                                             official: model.official,
                                             fshop: model.fshop)
        eventHandler?.presentFilterViewController(model: filterModel, delegate: self)
    }
}

// MARK: UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if self.products.isEmpty {
            return 1
        }
        
        return products.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.products.isEmpty {
            let loadingCollectionViewCell = productCollectionView.dequeueReusableCell(forIndexPath: indexPath) as LoadingCollectionViewCell
            return loadingCollectionViewCell
        }
        
        let productCollectionViewCell = productCollectionView.dequeueReusableCell(forIndexPath: indexPath) as ProductCollectionViewCell
        let dataSource = products[indexPath.row]
        productCollectionViewCell.dataSource = dataSource
        
        return productCollectionViewCell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if canLoadMoreProduct() {
            
            self.model.start = "\(Int(self.model.start)! + Constants.LoadMoreProduct)"
            eventHandler?.requestMoreProduct(model: model)
            
        }
        
    }
    
    fileprivate func canLoadMoreProduct() -> Bool {
        let precentScrolled = (productCollectionView.contentOffset.y + UIScreen.main.bounds.size.height)
            / productCollectionView.contentSize.height
        
        if precentScrolled > 0.9 {
            return true
        }
        
        return false
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if self.products.isEmpty {
            return LoadingCollectionViewCell.getCellSize()
        }
        
        return ProductCollectionViewCell.getCellSize()
    }
    
}

// MARK: - FilterViewControllerDelegate
extension SearchViewController: FilterViewControllerDelegate {
    func applyButtonDidClicked(withModel filterProductModel: FilterProductModel) {
        
        self.model = self.buildProductModel(withFilterModel: filterProductModel)
        self.requestProduct()
        
    }
    
    fileprivate func buildProductModel(withFilterModel model: FilterProductModel) -> RequestProductModel {
        
        var newModel = self.model
        
        newModel.q = model.keyword
        newModel.pmin = model.pmin
        newModel.pmax = model.pmax
        newModel.wholesale = model.wholesale
        newModel.fshop = model.fshop
        newModel.official = model.official
        newModel.start = "0"
        newModel.rows = "10"
        
        return newModel
        
    }
}
