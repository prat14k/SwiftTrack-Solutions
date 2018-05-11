//
//  APIRoutes.swift
//  POP Networking
//
//  Created by vinsol on 5/10/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation


enum ApplicationBaseRoutes: String {
    
    case live = "http://api.openweathermap.org/data/2.5/"
    case qa = "qa"
    case development = "development"
    
}


struct Routes: BasePathProtocol {
    
    static var basePath: String {  return ApplicationBaseRoutes.live.rawValue }

    public struct Weather: GetRequestProtocol {
        static var route: String { return "\(basePath)/weather" }
    }

}

