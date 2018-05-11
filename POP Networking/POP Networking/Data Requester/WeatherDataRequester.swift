//
//  WeatherDataRequester.swift
//  POP Networking
//
//  Created by vinsol on 5/11/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation
import Alamofire


typealias JSONResponseType = [String: Any]


struct WeatherDataRequester: JSONResponseValidation {
    
    typealias ResponseType = DataResponse<Any>
    
    static func requestData(completionHandler: @escaping (JSONResponseType? , Error?) -> Void) {
        
        Alamofire.request(Routes.Weather.get(parameters: ["zip": 95050, "appid": "fd4698c940c6d1da602a70ac34f0b147", "units": "imperial"])).responseJSON { (response) in
            
            do {
                let weatherData = try fetchData(from: response)
                completionHandler(weatherData, nil)
            }
            catch {
                completionHandler(nil, error)
            }
            
        }

    }
    
}










//catch RequestError.network(let error, let error_code) {
//    print("\(error_code) : \(error)")
//}
//catch RequestError.response(let error, let error_code) {
//    print("\(error_code) : \(error)")
//}
//catch RequestError.multipleResponse(let errors, let error_code) {
//    print("\(error_code) : ")
//    for error in errors {
//        print("\(error.key) : \(error.value)")
//    }
//}
//catch {
//    print(error.localizedDescription)
//}
