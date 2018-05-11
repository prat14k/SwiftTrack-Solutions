//
//  NetworkProtocol.swift
//  POP Networking
//
//  Created by vinsol on 5/10/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation
import Alamofire


protocol BasePathProtocol {
    static var basePath: String { get }
}

protocol URLProtocol {
    static var route: String { get }
}


protocol GetRequestProtocol: URLProtocol { }
extension GetRequestProtocol {
    static func get(parameters: Parameters?, encoding: URLEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> RequestTransformable {
        return RequestTransformable(route: route, method: .get, parameters: parameters)
    }
}

protocol PostRequestProtocol: URLProtocol { }
extension PostRequestProtocol {
    static func post(parameters: Parameters?, encoding: URLEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> RequestTransformable {
        return RequestTransformable(route: route, method: .post, parameters: parameters)
    }
}
















//protocol Request { }
//extension Request {
//    static func create(route: String, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) {
//
//        let request = URLRequest(
//
//    }
//}


//protocol RequestProtocol {
//    static var route: String { get set }
//    static var method: HTTPMethod { get set }
//}
//extension RequestProtocol {
//
//    static func create(parameters: [String:Any], encoding: URLEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> RequestTransform {
//        let mainRoute = "\(route)"
//        return RequestTransform(route: mainRoute, method: method, parameters: parameters, parameterEncoding = encoding, headers = headers)
//    }
//
//}
