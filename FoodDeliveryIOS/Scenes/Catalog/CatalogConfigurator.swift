//
//  CatalogConfigurator.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import Foundation
import UIKit

final class CatalogConfigurator {
    
    static let shared = CatalogConfigurator()
    private init() {}
    
    func configure(_ viewController: CatalogViewController) {
        let service = NetworkService()
        let interactor = CatalogInteractor(service: service)
        let presenter = CatalogPresenter()
        let router = CatalogRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

