//
//  APIRouter.swift
//  TestRxSwift
//
//  Created by AnDy on 29/06/2021.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case generateVideChatToken(channelId: String)
    
    //MARK: - Http Method
    private var method: HTTPMethod {
        switch self {
        case .generateVideChatToken:
            return .get
        }
    }
    
    //MARK: - Path
    //The path is the part following the base url
    private var path: String {
        switch self {
        case .generateVideChatToken:
            return "access_token"
        }
    }
    
    
    //MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .generateVideChatToken:
            return nil
        }
    }
    
    
    // MARK: - Headers
    private var queries: [Query]? {
        switch self {
        case .generateVideChatToken(let channelId):
            return [Query(key: "channel", value: channelId)]
        }
    }
    
    
    //MARK: - URL Request Convertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try Constants.tokenGeneratorUrl.asURL()
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
        
        //        urlRequest.setValue("Bearer \(Constants.Parameters.token)", forHTTPHeaderField: Constants.HttpHeaderField.authentication.rawValue)
        
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
