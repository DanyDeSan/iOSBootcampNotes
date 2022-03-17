//
//  CustomError.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 16/03/22.
//

import Foundation

enum NetworkError: Int, Error {
    case badRequest = 400
    case loginFailed = 401
    case userDisabled = 403
    case unprocesableEntity = 422
    case notFound = 404
    case methodNotAllowed = 405
    case serverError = 500
    case noConnection = -1009
    case timeOutError = -1001
    case unrecognized
    
    static func networkErrorFrom(statusCode: Int) -> NetworkError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .loginFailed
        case 403: return .userDisabled
        case 422: return .unprocesableEntity
        case 404: return .notFound
        case 405: return .methodNotAllowed
        case 500: return .serverError
        case -1009: return .noConnection
        case -1001: return .timeOutError
        default: return .unrecognized
        }
    }
}
