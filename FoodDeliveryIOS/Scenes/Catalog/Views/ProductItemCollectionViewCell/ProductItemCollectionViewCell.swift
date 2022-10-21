//
//  ProductItemCollectionViewCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 20.10.2022.
//

import UIKit

class ProductItemCollectionViewCell: UICollectionViewCell {

    static let nibName = "ProductItemCollectionViewCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameProduct: UILabel!
    @IBOutlet weak var descriptionProduct: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var costButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

}

// MARK: - Public methods
extension ProductItemCollectionViewCell {
    
    func setupCell(with model: Product) {
        nameProduct.text = model.name
        descriptionProduct.text = model.description
        imageProduct.kf.setImage(with: URL(string: model.image ?? ""))
        costButton.setTitle("от \(model.cost!) р", for: .normal)
        costButton.setTitle("от \(model.cost!) р", for: .highlighted)
    }
}

// MARK: - Private methods

extension ProductItemCollectionViewCell {
    
    func setup() {
        costButton.setTitleColor(R.color.textCategoryActive(), for: .normal)
        costButton.setTitleColor(.yellow, for: .highlighted)
        costButton.titleLabel?.font = R.font.sfuiDisplayLight(size: 1) ?? UIFont.systemFont(ofSize: 10, weight: .regular)
        descriptionProduct.textColor = R.color.textCategoryUnactive()
    }
}


