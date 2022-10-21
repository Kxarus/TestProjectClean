//
//  CatalogModels.swift
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

enum Catalog {
      // MARK: Use cases
      
    enum Model {
        struct Request {
            enum RequestType {
                case fetchProducts
                case fetchSales
            }
        }
        struct Response {
            enum ResponseType {
                case products(_ response: CatalogResponse)
//                case productsRM(_ data: [ProductRM])
                case sales(_ response: SalesResponse)
//                case salesRM(_ data: [SalesRM])
            }
        }
        struct ViewModel {
            enum ViewModelType {
                case products(_ data: [Product])
//                case productsRM(_ data: [ProductRM])
                case categories(_ categories: [CategoryModel])
                case sales(_ sales: [Sales])
//                case salesRM(_ sales: [SalesRM])
            }
        }
    }
}

// MARK: - Category Model
struct CategoryModel: Hashable {
    let name: String
    var isSelected: Bool
}

