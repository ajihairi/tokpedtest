//
//  ShopTypeTableViewCell.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/7/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

private enum Constants {
    static let AddTitle = "Add"
    static let RemoveTitle = "Remove"
}

protocol ShopTypeTableViewCellDelegate: class {
    func actionButtonDidClicked(type: String,
                                action: String)
}

class ShopTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shopTypeLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var dataSource: String? {
        didSet {
            didSetDataSource()
        }
    }
    
    var isFromFilterViewController = false {
        didSet {
            didSetIsFromShopTypeViewController()
        }
    }
    
    weak var delegate: ShopTypeTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func didSetDataSource() {
        guard let dataSource = self.dataSource else { return }
        self.shopTypeLabel.text = dataSource
    }
    
    fileprivate func didSetIsFromShopTypeViewController() {
        if self.isFromFilterViewController {
            self.actionButton.isHidden = true
            self.layoutIfNeeded()
        }
    }
    
    @IBAction func actionButtonDidClicked(_ sender: UIButton) {
        
        let action = sender.title(for: .normal) ?? Constants.AddTitle
        let isAdd = action != Constants.AddTitle
        
        self.setActionButtonTitle(isAdd: isAdd)
        
        delegate?.actionButtonDidClicked(type: self.shopTypeLabel.text ?? "",
                                         action: action)
    }
    
    
    func setActionButtonTitle(isAdd: Bool) {
        if isAdd {
            self.actionButton.setTitle(Constants.AddTitle, for: .normal)
        } else {
            self.actionButton.setTitle(Constants.RemoveTitle, for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
