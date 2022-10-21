//
//  CategoryCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let nibName = "CategoryCell"
    static let reuseId = nibName

    // MARK: - IBOutlets
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

}

// MARK: - Public methods
extension CategoryCell {
    
    func setupCell(with model: CategoryModel) {
        titleLabel.text = model.name
        if model.isSelected {
            enabled()
        } else {
            unenabled()
        }
    }
    
    func unenabled() {
        titleLabel.textColor = R.color.textCategoryUnactive()
        titleLabel.font = R.font.sfuiDisplayLight(size: 13)
        
        borderView.backgroundColor = R.color.mainBackground()
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = R.color.textCategoryUnactive()?.cgColor
    }
    
    func enabled() {
        titleLabel.textColor = R.color.textCategoryActive()
        titleLabel.font = R.font.sfuiDisplayBold(size: 20)
        
        borderView.backgroundColor = R.color.categoryBackgroundActive()
        borderView.layer.borderWidth = 0
    }
    
}

// MARK: - Private methods
private extension CategoryCell {
    
    func setup() {
        borderView.layer.cornerRadius = 16
        titleLabel.textAlignment = .center
        unenabled()
    }
}

