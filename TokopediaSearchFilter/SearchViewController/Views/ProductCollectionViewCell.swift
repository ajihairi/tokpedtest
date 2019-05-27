//
//  ProductCollectionViewCell.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productThumbnailImageVIew: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var dataSource: Product? {
        didSet {
            didSetDataSource()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func getCellSize() -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2,
                      height: (UIScreen.main.bounds.height / 2.5))
    }

    fileprivate func didSetDataSource() {
        guard let dataSource = self.dataSource else { return }
        
        if let url = URL(string: dataSource.imageUri) {
            self.productThumbnailImageVIew.sd_setImage(with: url, completed: nil)
        }
        self.productTitleLabel.text = dataSource.name
        self.productPriceLabel.text = dataSource.price
    }
}
