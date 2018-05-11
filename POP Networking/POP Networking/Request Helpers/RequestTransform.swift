//
//  RequestTransform.swift
//  POP Networking
//
//  Created by vinsol on 5/10/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation
import Alamofire


struct RequestTransformable: URLRequestConvertible {
    
    let route: String
    let method: HTTPMethod
    let headers: HTTPHeaders
    let parameters: Parameters?
    let encoding: URLEncoding
    
    init(route: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: URLEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) {
        
        self.route = route
        self.method = method
        self.parameters = parameters
        self.headers = headers != nil ? headers! : [:]
        self.encoding = encoding
        
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try route.asURL()
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        for (key,value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}
