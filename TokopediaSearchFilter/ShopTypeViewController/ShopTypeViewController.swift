//
//  ShopTypeViewController.swift
//  TokopediaShopTypeFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

private enum Constants {
    static let FirstSectionTitle = "Shop Type"
    static let GoldMerchant = "Gold Merchant"
    static let OfficialStore = "Official Store"
    static let ShopTypeTableViewCell = "ShopTypeTableViewCell"
}

protocol ShopTypeViewControllerDelegate: class {
    func applyButtonDidClicked(withDataSource dataSource: [String])
}

class ShopTypeViewController: UIViewController, ShopTypeView {
    
    var eventHandler: ShopTypeModuleInterface?
    
    fileprivate var dataSource: [String] {
        didSet {
            self.shopTypeTableView.reloadData()
        }
    }
    
    fileprivate var duplicateDataSource: [String]
    
    fileprivate var defaultDataSource = [Constants.GoldMerchant,
                                         Constants.OfficialStore]
    
    @IBOutlet weak var shopTypeTableView: UITableView!
    
    weak var delegate: ShopTypeViewControllerDelegate?
    
    init(withDataSource dataSource: [String],
         delegate: ShopTypeViewControllerDelegate) {
        self.dataSource = dataSource
        self.duplicateDataSource = dataSource
        self.delegate = delegate
        super.init(nibName: String(describing: ShopTypeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.shopTypeTableView.register(UINib(nibName: Constants.ShopTypeTableViewCell, bundle: nil),
                                        forCellReuseIdentifier: Constants.ShopTypeTableViewCell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func closeButtonDidClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonDidClicked(_ sender: UIButton) {
        self.duplicateDataSource = self.dataSource
        self.shopTypeTableView.reloadData()
    }
    
    @IBAction func applyButtonDidClicked(_ sender: UIButton) {
        self.delegate?.applyButtonDidClicked(withDataSource: self.duplicateDataSource)
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: - UITableViewDataSource
extension ShopTypeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.FirstSectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.defaultDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shopTypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ShopTypeTableViewCell) as! ShopTypeTableViewCell
        
        let defaultDataSource = self.defaultDataSource[indexPath.row]
        
        if self.dataSource.contains(defaultDataSource) {
            shopTypeTableViewCell.setActionButtonTitle(isAdd: false)
        } else {
            shopTypeTableViewCell.setActionButtonTitle(isAdd: true)
        }
        
        shopTypeTableViewCell.dataSource = defaultDataSource
        shopTypeTableViewCell.delegate = self
        
        return shopTypeTableViewCell
        
    }
    
}

// MARK: - ShopTypeTableViewCellDelegate
extension ShopTypeViewController: ShopTypeTableViewCellDelegate {
    func actionButtonDidClicked(type: String, action: String) {
        
        switch action {
        case "Add":
            if self.duplicateDataSource.contains(type) == false {
                self.duplicateDataSource.append(type)
            }
        case "Remove":
            if self.duplicateDataSource.contains(type) {
                self.duplicateDataSource.remove(at: self.duplicateDataSource.index(of: type)!)
            }
        default:
            break
        }
        
    }
}
