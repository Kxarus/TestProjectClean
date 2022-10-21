//
//  TabBarInteractor.swift
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

protocol TabBarBusinessLogic {
    
}

protocol TabBarDataStore: AnyObject {
    //var name: String { get set }
}

final class TabBarInteractor {
    
    // MARK: - External vars
    var presenter: TabBarPresentationLogic?
    var worker: TabBarWorker?
    //var name: String = ""
    
    // MARK: - Internal vars
    
}

// MARK: - Business logic
extension TabBarInteractor: TabBarBusinessLogic {
    
}

// MARK: - Data store
extension TabBarInteractor: TabBarDataStore {
    
}

