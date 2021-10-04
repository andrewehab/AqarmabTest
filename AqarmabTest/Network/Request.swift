//
//  Request.swift
//  TestRxSwift
//
//  Created by AnDy on 04/10/2021.
//

import Alamofire
import RxSwift

class Request {
    
    //MARK: - Request With Result Data
    static func requestWithResult<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            
            let request = AF.request(urlConvertible).validate(statusCode: 200..<300) .responseDecodable { (response: AFDataResponse<T> ) in
                
                switch response.result {
                
                case .success(let value):
                    //Everything is fine, return the value in onNext
                    observer.onNext(value)
                    observer.onCompleted()
                    
                case .failure(let error):
                    //Something went wrong, switch on the status code and return the error
                    observer.onError(error)
                }
            }
            
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
}
