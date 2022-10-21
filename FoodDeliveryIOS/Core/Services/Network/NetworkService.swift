//
//  NetworkService.swift
//  TestProject
//
//  Created by Roman Kiruxin on 18.10.2022.
//

import Foundation
import Moya
import Alamofire

protocol NetworkServiceable {
    func request<T: Decodable>(_ endPoint: APIEndPoint, completion: @escaping (Result<T, ApiErrorModel>) -> Void)
}

struct ApiErrorModel: Swift.Error {
    let type: String
    let message: String
    let code: Int
    let request: String
}

final class NetworkService {
    
    private let provider = MoyaProvider<TargetProvider>(endpointClosure: NetworkService.endpointClosure, session: DefaultAlamofireManager.sharedManager)
    
    private static func customEndpointMapping(for target: TargetProvider) -> Endpoint {
        let url = "\(target.baseURL.absoluteString)\(target.path)"
        
        return Endpoint(url: url,
                        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }

    static let endpointClosure = { (target: TargetProvider) -> Endpoint  in
        let defaultEndpoint = customEndpointMapping(for: target)
        return defaultEndpoint
    }
}

extension NetworkService: NetworkServiceable {
    
    func request<T: Decodable>(
        _ endPoint: APIEndPoint,
        completion: @escaping (Result<T, ApiErrorModel>) -> Void ) {
        
        let targetProvider = TargetProvider(with: endPoint)
        
        let urlRequest = "\(targetProvider.baseURL)\(targetProvider.path)"
            
            print("URLRequest - \(urlRequest)")
        provider.request(targetProvider, completion: { (result) in
            switch result {
            case let .success(response):
                let statusCode = response.statusCode
                print("Status code - \(statusCode)")
                switch statusCode {
                case 200...210:
                    do {
                        let result: T = try response.data.decode()
                        completion(.success(result))
                    } catch {
                        completion(.failure(ApiErrorModel(type: "Invalid Data", message: "Decode error", code: statusCode, request: urlRequest)))
                    }
                default:
                    print("WTF")
                }
            case .failure(let error):
                completion(.failure(ApiErrorModel(type: "Internal Error", message: "Internal Error", code: error.response?.statusCode ?? 0, request: urlRequest)))
            }
        })
    }
}

extension Data {
    func decode<T: Decodable>(type: T.Type = T.self) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decoded = try decoder.decode(type, from: self)
            return decoded
        } catch {
            print("❗DECODING ERROR❗: \(error)")
            print(error.localizedDescription)
            throw error
        }
    }
}

class DefaultAlamofireManager: Alamofire.Session {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }()
}
