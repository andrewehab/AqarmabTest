//
//  APIError.swift
//  TestRxSwift
//
//  Created by AnDy on 29/06/2021.
//

import Foundation

enum APIError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}
