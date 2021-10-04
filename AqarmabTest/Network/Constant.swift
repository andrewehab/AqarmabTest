//
//  Constants.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

struct Constants {
    
    //MARK: - The API's Base URL
    static let baseURL = "https://api.themoviedb.org/3"
    static let imageURL = "https://image.tmdb.org/t/p/w500"
    
    
    //MARK: - The parameters (Queries)
    struct Parameters {
        static let apiKey = HelperMethod.valueForPlistKey(plistName: "Secrets", named: "API-KEY")
    }
    
    
    //MARK: - Header Fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    
    //MARK: - Content Type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
    
}
