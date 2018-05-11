//
//  ViewController.swift
//  POP Networking
//
//  Created by vinsol on 5/10/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

// http://api.openweathermap.org/data/2.5/weather?zip=95050&appid=fd4698c940c6d1da602a70ac34f0b147&units=imperial



import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getWeatherData()
    }
    
    
    
    func getWeatherData() {
        
        WeatherDataRequester.requestData { (response, error) in
            
            if error != nil {
                if let error = error as? RequestError {
                    switch error {
                        
                    case RequestError.network(let error, let error_code):
                        print("\(error_code) : \(error)")
                    case RequestError.response(let error, let error_code):
                        print("\(error_code) : \(error)")
                    case RequestError.multipleResponse(let errors, let error_code):
                        print("\(error_code) : ")
                        for error in errors {
                            print("\(error.key) : \(error.value)")
                        }
                    }
                } else {
                    print(error!.localizedDescription)
                }
            } else if let response = response {
                print(response)
            }
            
        }
        
    }
    

}

