//
//  CatalogRouter.swift
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

@objc protocol CatalogRoutingLogic {
    
}

protocol CatalogDataPassing {
    var dataStore: CatalogDataStore? { get }
}

final class CatalogRouter: NSObject {
    
    // MARK: - External vars
    weak var viewController: CatalogViewController?
    weak var dataStore: CatalogDataStore?
    
    // MARK: - Internal vars
}

// MARK: - Routing logic
extension CatalogRouter: CatalogRoutingLogic {
    
}

// MARK: - Data passing
extension CatalogRouter: CatalogDataPassing {
    
}
