//
//  SalesSectionCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import UIKit

protocol SalesSectionCellDelegate: AnyObject {

}

class SalesSectionCell: UICollectionViewCell {

    static let nibName = "SalesSectionCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - External vars
    weak var delegate: SalesSectionCellDelegate?
    
    // MARK: - Internal vars
    private var model: [Sales] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - CollectionView Data Source
extension SalesSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCell.reuseId, for: indexPath) as? SaleCell else {
            return UICollectionViewCell()
        }
        
        cell.setupCell(with: model[indexPath.item])
        return cell
    }
}

// MARK: - CollectionView Delegate
extension SalesSectionCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

// MARK: - CollectionView Flow Layout
extension SalesSectionCell: UICollectionViewDelegateFlowLayout {
    
}

// MARK: - Public methods
extension SalesSectionCell {
    
    func setupCell(with model: [Sales]) {
        self.model = model
        collectionView.reloadData()
    }
}

// MARK: - Private methods
private extension SalesSectionCell {
    
    func setup() {
        contentView.backgroundColor = R.color.mainBackground()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: SaleCell.nibName, bundle: nil), forCellWithReuseIdentifier: SaleCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 300, height: 112)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = R.color.mainBackground()
    }
}
