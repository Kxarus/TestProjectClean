//
//  TabBarConfigurator.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import Foundation
import UIKit

final class TabBarConfigurator {
    
    static let shared = TabBarConfigurator()
    private init() {}
    
    func configure(_ viewController: TabBarViewController) {
        let interactor = TabBarInteractor()
        let presenter = TabBarPresenter()
        let router = TabBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
