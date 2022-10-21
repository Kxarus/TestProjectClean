//
//  CategorySectionCell.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import UIKit

protocol CategorySectionCellDelegate: AnyObject {
    func didTapCategory(with categoryId: String)
}

class CategorySectionCell:  UICollectionReusableView {
    
    static let nibName = "CategorySectionCell"
    static let reuseId = nibName
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - External var
    weak var delegate: CategorySectionCellDelegate?
    
    // MARK: - Internal vars
    private var model: [CategoryModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - CollectionView Data Source
extension CategorySectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as? CategoryCell else {
            return UICollectionViewCell()
        }
        if  indexPath.item == 0 {
            cell.enabled()
        }
        cell.setupCell(with: model[indexPath.item])
        return cell
    }
}

// MARK: - CollectionView Delegate
extension CategorySectionCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        collectionView.deselectItem(at: indexPath, animated: true)
        let categoryId = model[indexPath.item].name
        delegate?.didTapCategory(with: categoryId)
        selectCell(with: indexPath)
    }
}

// MARK: - CollectionView Flow Layout
extension CategorySectionCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let label = UILabel(frame: CGRect.zero)
//        label.font = UIFont(resource: R.font.sfuiDisplayLight, size: 13)
//        label.text = model[indexPath.item].name
//        label.sizeToFit()
//        return CGSize(width: label.frame.width + 16, height: 33)
        return CGSize(width: 88, height: 32)
    }
}

// MARK: - Public methods
extension CategorySectionCell {
    
    func setupCell(with model: [CategoryModel]) {
        self.model = model
        collectionView.reloadData()
    }
    
    func selectCell(with indexPath: IndexPath) {
        if (model.count == 0){
            return
        }
        let categoryId = model[indexPath.row]
        
        var newModel: [CategoryModel] = []
        
        let _ = model.map { (category) in
            if category.name == categoryId.name {
                let item = CategoryModel(name: category.name, isSelected: true)
                newModel.append(item)
            } else {
                let item = CategoryModel(name: category.name, isSelected: false)
                newModel.append(item)
            }
        }
        
        model = newModel
        collectionView.reloadData()
    }
}

// MARK: - Private methods
private extension CategorySectionCell {
    
    func setup() {
        //selectionStyle = .none
        backgroundColor = R.color.mainBackground()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CategoryCell.nibName, bundle: nil), forCellWithReuseIdentifier: CategoryCell.reuseId)
        collectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = R.color.mainBackground()
    }
}
