//
//  APIClient.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Alamofire
import RxSwift

class APIClient {
    
    // MARK: - Get Popular Movies
    static func getPopularMovies(page: Int) -> Observable<Movies> {
        return Request.requestWithResult(APIRouter.getPopularMovies(page: page))
    }
    
}
