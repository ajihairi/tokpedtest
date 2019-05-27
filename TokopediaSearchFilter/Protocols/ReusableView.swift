//
//  ReusableView.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView {}

extension UICollectionReusableView: ReusableView {}
