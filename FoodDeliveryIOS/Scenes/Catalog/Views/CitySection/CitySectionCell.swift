//
//  CitySectionCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import UIKit

class CitySectionCell: UICollectionViewCell {
    
    static let nibName = "CitySectionCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    @IBOutlet weak var city: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
}

// MARK: - Public methods
private extension CitySectionCell {
    
    func setup() {
        backgroundColor = R.color.mainBackground()
        city.setTitleColor(.black, for: .normal)
        city.setTitleColor(.yellow, for: .highlighted)
        city.setTitle("Москва ", for: .normal)
    }
}
