//
//  Validator.swift
//  POP Networking
//
//  Created by vinsol on 5/10/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation
import Alamofire



protocol ResponseValidation {
    
    associatedtype ResponseType
    
    static func validate(response: ResponseType) throws
    static func fetchData(from response: ResponseType) throws -> JSONResponseType
    
}



protocol JSONResponseValidation: ResponseValidation { }

extension JSONResponseValidation where ResponseType == DataResponse<Any> {
    
    static func fetchData(from response: ResponseType) throws -> JSONResponseType {
        try validate(response: response)
        
        // parsing of the data can be done if the response is validated sucessfully
        // Right now just forcing it
        return response.result.value as! [String:Any]
    }
    
    
    static func validate(response: ResponseType) throws {
        if let error = response.result.error {
            throw RequestError.network(error: error.localizedDescription, error_code: error.code)
        } else {
            if let response = response.result.value as? [String: Any] {
                if let error_code = response["error_code"] as? Int {
                    if let error = response["error"] as? String {
                        throw RequestError.response(error: error, error_code: error_code)
                    } else if let errors = response["errors"] as? [String:String] {
                        throw RequestError.multipleResponse(errors: errors, error_code: error_code)
                    } else {
                        throw RequestError.response(error: "Unknown error description", error_code: error_code)
                    }
                }
            }
        }
    }
    
}













// Assuming that the response error is stated like below
//            {
//                error_code: Int
//                errors: [
//                {
//                "field1": "Error description"
//                }
//                ]
//              // Other Info
//            }
// //OR
//            {
//                error_code: Int
//                error: "Error description"
//
//              // Other Info
//            }


