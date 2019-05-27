//
//  FilterViewController.swift
//  TokopediaFilterFilter
//
//  Created by Hamzhya Tinnov on 27/5/19.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import UIKit

private enum Constants {
    static let FirstSectionTitle = "Shop Type"
    static let MaximumValue: Float = 1000000
    static let MinimumValue: Float = 0
    static let GoldMerchant = "Gold Merchant"
    static let OfficialStore = "Official Store"
    static let ShopTypeTableViewCell = "ShopTypeTableViewCell"
}

protocol FilterViewControllerDelegate: class {
    func applyButtonDidClicked(withModel filterProductModel: FilterProductModel)
}

class FilterViewController: UIViewController, FilterView {
    
    var eventHandler: FilterModuleInterface?
    fileprivate var model: FilterProductModel
    fileprivate var shopTypeModel: ShopTypeProductModel? {
        didSet {
            didSetShopTypeModel()
        }
    }
    fileprivate var dataSourceShopTypeTableView = [String]() {
        didSet {
            didSetDataSourceShopTypeTableView()
        }
    }
    
    @IBOutlet weak var minimumPriceLabel: UILabel!
    @IBOutlet weak var minimumPriceSlider: UISlider!
    @IBOutlet weak var maximumPriceLabel: UILabel!
    @IBOutlet weak var maximumPriceSlider: UISlider!
    @IBOutlet weak var wholesaleSwitch: UISwitch!
    @IBOutlet weak var shopTypeTableView: UITableView!
    @IBOutlet weak var keywordTextField: UITextField!
    
    weak var delegate: FilterViewControllerDelegate?
    
    init(withModel model: FilterProductModel,
         delegate: FilterViewControllerDelegate) {
        self.model = model
        self.delegate = delegate
        super.init(nibName: String(describing: FilterViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.configureUI()
        self.shopTypeTableView.register(UINib(nibName: Constants.ShopTypeTableViewCell, bundle: nil),
                                        forCellReuseIdentifier: Constants.ShopTypeTableViewCell)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.presentShopTypeViewController))
        self.shopTypeTableView.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func configureUI() {
        
        self.keywordTextField.text = model.keyword
        self.minimumPriceLabel.text = model.pmin
        self.configureMinimumSlider(withMinimumPrice: model.pmin)
        self.maximumPriceLabel.text = model.pmax
        self.configureMaximumSlider(withMaximumPrice: model.pmax)
        
        if let isWholesale = Bool(model.wholesale) {
            self.wholesaleSwitch.isOn = isWholesale
        }
        
        self.shopTypeModel = ShopTypeProductModel(official: model.official,
                                                  fshop: model.fshop)
        
    }
    
    fileprivate func configureMinimumSlider(withMinimumPrice min: String) {
        self.minimumPriceSlider.minimumValue = Constants.MinimumValue
        self.minimumPriceSlider.maximumValue = Constants.MaximumValue
        
        if let floatMin = Float(min) {
            self.minimumPriceSlider.value = floatMin
        }
        
    }
    
    fileprivate func configureMaximumSlider(withMaximumPrice max: String) {
        self.maximumPriceSlider.minimumValue = Constants.MinimumValue
        self.maximumPriceSlider.maximumValue = Constants.MaximumValue
        
        if let floatMax = Float(max) {
            self.maximumPriceSlider.value = floatMax
        }
    }
    
    fileprivate func didSetShopTypeModel() {
        guard let shopTypeModel = self.shopTypeModel else { return }
        
        self.dataSourceShopTypeTableView.removeAll()
        
        if let isGoldMerchant = Int(shopTypeModel.fshop),
            isGoldMerchant > 0 {
            self.dataSourceShopTypeTableView.append(Constants.GoldMerchant)
        }
        
        if let isOfficialStore = Bool(shopTypeModel.official),
            isOfficialStore {
            self.dataSourceShopTypeTableView.append(Constants.OfficialStore)
        }
    }
    
    fileprivate func didSetDataSourceShopTypeTableView() {
        self.shopTypeTableView.reloadData()
    }
    
    @IBAction func minimumPriceSliderDidChanged(_ sender: UISlider) {
        self.minimumPriceLabel.text = String(Int(sender.value))
    }
    
    @IBAction func maximumPriceSliderDidChanged(_ sender: UISlider) {
        self.maximumPriceLabel.text = String(Int(sender.value))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func closeButtonDidClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButtonDidClicked(_ sender: UIButton) {
        self.configureUI()
        self.shopTypeTableView.reloadData()
    }
    
    @IBAction func applyButtonDidClicked(_ sender: UIButton) {
        var newModel = FilterProductModel()
        
        newModel.keyword = self.keywordTextField.text! == "" ? "samsung" : self.keywordTextField.text!
        newModel.pmin = self.minimumPriceLabel.text!
        newModel.pmax = self.maximumPriceLabel.text!
        newModel.wholesale = self.wholesaleSwitch.isOn ? "true" : "false"
        
        if self.dataSourceShopTypeTableView.contains(Constants.GoldMerchant) {
            newModel.fshop = "2"
        }
        
        if self.dataSourceShopTypeTableView.contains(Constants.OfficialStore) {
            newModel.official = "true"
        }
        
        self.delegate?.applyButtonDidClicked(withModel: newModel)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentShopTypeViewController() {
        eventHandler?.presentShopTypeViewController(withDataSource: self.dataSourceShopTypeTableView, delegate: self)
    }
    
}

// MARK: - UITableViewDataSource
extension FilterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.FirstSectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceShopTypeTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shopTypeTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ShopTypeTableViewCell) as! ShopTypeTableViewCell
        shopTypeTableViewCell.dataSource = dataSourceShopTypeTableView[indexPath.row]
        shopTypeTableViewCell.isFromFilterViewController = true
        
        return shopTypeTableViewCell
        
    }
}

// MARK: - ShopTypeViewControllerDelegate
extension FilterViewController: ShopTypeViewControllerDelegate {
    func applyButtonDidClicked(withDataSource dataSource: [String]) {
        self.dataSourceShopTypeTableView = dataSource
    }
}
