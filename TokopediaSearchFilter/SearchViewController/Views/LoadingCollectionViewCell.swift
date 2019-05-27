//
//  LoadingCollectionViewCell.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/7/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        loadingView.startAnimating()
    }
    
    static func getCellSize() -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width,
                      height: UIScreen.main.bounds.height)
    }

}
