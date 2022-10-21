//
//  CategoryCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import UIKit
import Kingfisher

class SaleCell: UICollectionViewCell {
    
    static let nibName = "SaleCell"
    static let reuseId = nibName

    // MARK: - IBOutlets
    @IBOutlet weak var saleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

}

// MARK: - Public methods
extension SaleCell {
    
    func setupCell(with model: Sales) {
        saleImageView.kf.setImage(with: URL(string: model.image ?? ""))
    }
    
    func setupCellRM(with modelRM: SalesRM) {
        saleImageView.image = UIImage(data: modelRM.image)
    }
}

// MARK: - Private methods
private extension SaleCell {
    
    func setup() {
        layer.cornerRadius = 16
        saleImageView.contentMode = .scaleAspectFill
    }
}
