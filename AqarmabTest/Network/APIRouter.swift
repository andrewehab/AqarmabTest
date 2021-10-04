//
//  APIRouter.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case getPopularMovies(page: Int)
    
    
    //MARK: - Http Method
    private var method: HTTPMethod {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }
    
    
    //MARK: - Path
    private var path: String {
        switch self {
        case .getPopularMovies:
            return "movie/popular"
        }
    }
    
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getPopularMovies:
            return nil
        }
    }
    
    
    // MARK: - Headers
    private var queries: [Query]? {
        switch self {
        case .getPopularMovies(let page):
            return [
                Query(key: "api_key", value: Constants.Parameters.apiKey),
                Query(key: "page", value: "\(page)")
            ]
        }
    }
    
    
    //MARK: - URL Request Convertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseURL.asURL()
        var components = URLComponents(string: "\(url)/\(path)")!
        
        if let queries = queries {
            components.queryItems = [URLQueryItem]()
            for query in queries {
                let queryItem = URLQueryItem(name: query.key, value: query.value)
                components.queryItems!.append(queryItem)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        
        var urlRequest = URLRequest(url: components.url!)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(Constants.ContentType.json.rawValue, forHTTPHeaderField: Constants.HttpHeaderField.contentType.rawValue)
        
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        
        return urlRequest
        
    }
    
    
}
