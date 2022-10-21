//
//  Services.swift
//  TestProject
//
//  Created by Roman Kiruxin on 18.10.2022.
//

import Foundation

final class Services {
    
    private let service: NetworkServiceable
    
    init(service: NetworkServiceable) {
        self.service = service
    }
}

// MARK: - Public methods
extension Services {
    func performCatalog(_ request: CatalogRequest, complition: @escaping (Result<CatalogResponse, ApiErrorModel>) -> Void) {
        service.request(.allCatalog(request: request), completion: complition)
    }
    
    func performSales(_ request: SalesRequest, complition: @escaping (Result<SalesResponse, ApiErrorModel>) -> Void) {
        service.request(.allSales(request: request), completion: complition)
    }
}
