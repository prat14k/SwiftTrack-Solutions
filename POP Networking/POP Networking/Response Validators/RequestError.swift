//
//  RequestError.swift
//  POP Networking
//
//  Created by vinsol on 5/11/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation



enum RequestError: Error {
    case network(error: String, error_code: Int)
    case response(error: String, error_code: Int)
    case multipleResponse(errors: [String: String], error_code: Int)
}

