//
//  APIEndPoint.swift
//  TestProject
//
//  Created by Roman Kiruxin on 18.10.2022.
//

import Foundation
import Alamofire
import Moya
import UIKit
import SwiftUI

enum APIEndPoint {
    case allSales(request: SalesRequest)
    case allCatalog(request: CatalogRequest)
}

struct TargetProvider: TargetType {
    var headers: [String : String]?
    
    var type: APIEndPoint
    
    init(with type: APIEndPoint) {
        self.type = type
    }
    
    public mutating func handle(for type: APIEndPoint) {
        self.type = type
    }
}

extension TargetProvider {
    
    var apiVersion: String {
        switch type {
        default:
            return "/v3"
        }
    }
    
    var baseURL: URL {
        switch type {
        default:
            return URL(string: "https://\(Constants.apiDomain)\(apiVersion)")!
        }
        
    }
    
    var path: String {
        switch type {
        case .allSales:
            return "/4c30a8c9-5c16-4460-9e47-4cc5460908ec"
        default:
            return "/dc2d4457-9a31-4bc5-9db0-2896dcea4d3f"
        }
    }
    
    var method: Moya.Method {
        switch type {
        default:
            return .post
        }
    }
    
    var methodDesc: String {
        switch method {
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        default:
            return "GET"
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch type {
        default:
            return .requestPlain
        }
    }
}

