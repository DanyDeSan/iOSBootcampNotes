//
//  Response.swift
//  MVVM-Login
//
//  Created by L Daniel De San Pedro on 16/03/22.
//

import Foundation

enum Response {
    case success(Data)
    case fail(NetworkError?,Error?)
}
