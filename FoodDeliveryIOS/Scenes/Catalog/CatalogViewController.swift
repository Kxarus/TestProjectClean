//
//  CatalogViewController.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CatalogDisplayLogic: AnyObject {
    func display(viewModel: Catalog.Model.ViewModel.ViewModelType)
}

protocol CatalogViewControllerDelegate: AnyObject {
    func scrollToSection(section: Int)
}

final class CatalogViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collectionView
    }()
    
    private let sectionInsets = UIEdgeInsets(
      top: 0.0,
      left: 0.0,
      bottom: 2.0,
      right: 0.0)
    
    weak var delegate:CatalogViewControllerDelegate?
    
    var header: CategorySectionCell = {
        let header = CategorySectionCell.fromNib()
        return header
    }()

    // MARK: - External vars
    var interactor: CatalogBusinessLogic?
    var router: (NSObjectProtocol & CatalogRoutingLogic & CatalogDataPassing)?
    
    // MARK: - Internal vars
    private var categories: [CategoryModel] = []
    private var products: [Product] = []
    private var productsRM: [ProductRM] = []
    private var sales: [Sales] = []
    private var salesRM: [SalesRM] = []
    private var selectedIndex = 0

    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        CatalogConfigurator.shared.configure(self)
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CatalogConfigurator.shared.configure(self)
    }
  
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - IBActions
}
// MARK: - Display logic
extension CatalogViewController: CatalogDisplayLogic {
    
    func display(viewModel: Catalog.Model.ViewModel.ViewModelType) {
        switch viewModel {
        case .categories(let categories):
            self.categories = categories
        case .products(let data):
            self.products = data
            collectionView.reloadData()
        case .sales(let sales):
            self.sales = sales
            collectionView.reloadData()
//        case .productsRM(let productsRM):
//            self.productsRM = productsRM
//            collectionView.reloadData()
//        case .salesRM(let salesRM):
//            self.salesRM = salesRM
//            collectionView.reloadData()
        }
    }
}

//MARK: - UICollactionView Delegates and DataSources
extension CatalogViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                                 UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
       layout collectionViewLayout: UICollectionViewLayout,
       minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return sectionInsets.bottom
     }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 16, left: 16, bottom: 5, right: 16)
        }
        else if section == 0 {
            return UIEdgeInsets(top: -55, left: 0, bottom: 10, right: 16)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            if sales.count == 0 && salesRM.count == 0 {
                return CGSize(width: view.frame.width, height: 0)
            }
        }
        
        return CGSize(width: view.frame.width, height: 50)//
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if(indexPath.section == 1) { 
            if kind == UICollectionView.elementKindSectionHeader {

                let headerView = collectionView.dequeueReusableSupplementaryView(
                      ofKind: kind,
                      withReuseIdentifier: CategorySectionCell.reuseId,
                    for: indexPath) as! CategorySectionCell

                headerView.setupCell(with: categories)
                headerView.delegate = self
                header = headerView
                return headerView

            } else { //No footer in this case but can add option for that
                 return UICollectionReusableView()
            }
        }else{
            let headerView = collectionView.dequeueReusableSupplementaryView(
                  ofKind: kind,
                  withReuseIdentifier: EmptyHeaderCollectionReusableView.reuseId,
                for: indexPath) as! EmptyHeaderCollectionReusableView
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        if section == 1 {
            return products.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            
            if(row == 0){
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CitySectionCell.reuseId, for: indexPath) as! CitySectionCell
                
                return cell
                
            }
            if (row == 1){
                
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: SalesSectionCell.reuseId, for: indexPath) as! SalesSectionCell
                
                if sales.count == 0 && salesRM.count == 0 {
                    cell.setupCell(with: sales)
                } else if sales.count == 0 {
                    cell.setupCellRM(with: salesRM)
                } else {
                    cell.setupCell(with: sales)
                }
                    cell.setupCell(with: sales)
                    return cell
            }
        }
        if section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductItemCollectionViewCell.reuseId, for: indexPath) as! ProductItemCollectionViewCell

                
            let model = products[row]
                
            cell.setupCell(with: model)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        let item = indexPath.item
        if section == 0 {
            if (item == 0){
                let width = view.frame.width
                return.init(width: width, height: 40)
            }else{
                let width = view.frame.width
                if sales.count == 0 {
                    return.init(width: width, height: 10)
                }
                return.init(width: width, height: 120)
            }
        }else{
            if indexPath.section == 1 {
            //
            //return.init(width: 200, height: 120)
//                if productsModel[indexPath.row].isHeader {
//                    return.init(width: view.frame.width - 24, height: 26)
//                }
                
                return.init(width: view.frame.width, height: 230)
                
                
            }
        }
        return.init(width: 0, height: 0)
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

// MARK: - Private methods
private extension CatalogViewController {
    
    func setupView() {
        view.backgroundColor = R.color.mainBackground()
        fetchData()
        configureCollectionView()
    }
    
    func fetchData() {
        interactor?.make(request: .fetchProducts)
        interactor?.make(request: .fetchSales)
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCells()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = R.color.mainBackground()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: SalesSectionCell.nibName, bundle: nil), forCellWithReuseIdentifier: SalesSectionCell.reuseId)
        
        collectionView.register(UINib(nibName: CategorySectionCell.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CategorySectionCell.reuseId)
        
        collectionView.register(UINib.init(nibName: CitySectionCell.nibName, bundle: nil), forCellWithReuseIdentifier: CitySectionCell.reuseId)
        collectionView.register(UINib.init(nibName: ProductItemCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: ProductItemCollectionViewCell.reuseId)
        collectionView.register(UINib(nibName: EmptyHeaderCollectionReusableView.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EmptyHeaderCollectionReusableView.reuseId)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
    }
}

extension CatalogViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        startScroll()
    }
    
    func startScroll() {
        collectionView.layoutIfNeeded()
        let cells = collectionView.indexPathsForVisibleItems
        
        var categoryIds: [String] = []
        let _ = cells.map({ (indexPath) in
            if indexPath.section == 1 {
                guard let categoryId = products[indexPath.row].category else {
                    return
                }
                if !categoryIds.contains(categoryId) {
                    categoryIds.append(categoryId)
                }
            }
        })
        let currentCategory = categoryIds.last
        var categoryIndex = 0
        let _ = categories.enumerated().filter { (index, category) -> Bool in
            if category.name == currentCategory {
                categoryIndex = index
                return true
            } else {
                return false
            }
        }
        
        if categories.count != 0 {
            if categoryIndex != selectedIndex && categoryIndex != 0  {
                selectedIndex = categoryIndex
                header.collectionView.scrollToItem(at: IndexPath(item: categoryIndex, section: 0), at: .centeredHorizontally, animated: true)
                header.selectCell(with: IndexPath(item: categoryIndex, section: 0))
            }
            if cells.contains(IndexPath(item: 0, section: 1)) {
                selectedIndex = 0
                header.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
                header.selectCell(with: IndexPath(item: 0, section: 0))
            }
        } else {
            return
        }
    }
}


// MARK: - CategorySectionCell Delegate
extension CatalogViewController: CategorySectionCellDelegate {
    
    func didTapCategory(with categoryId: String) {
        
        var productIndex = -1
        
        let _ = products.enumerated().filter { (index, product) -> Bool in
            if product.category == categoryId && productIndex == -1 {
                productIndex = index
                return true
            } else {
                return false
            }
        }.first
        if productIndex > 0 {
            collectionView.scrollToItem(at: IndexPath(row: productIndex, section: 1), at: .top, animated: true)
        } else  {
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
        
    }
}