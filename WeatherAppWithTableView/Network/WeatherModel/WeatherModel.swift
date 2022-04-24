//
//  WeatherModel.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import Alamofire
import UIKit


/// Weather Model
class WeatherModel {
    
    /**
     Get weather.
     - Parameter key: as String.
     - Parameter location: as String.
     - Parameter aqi: as String.
     - Parameter completion: as closure
     */
    static func getWeather(key: String, location: String, aqi: String,  completion: @escaping (Result<WeatherDetails, NetworkError>) -> Void){
        AF.request(WeatherRouter.getWeather(key: key, location: location, aqi: aqi)).responseDecodable(of: WeatherDetails.self){
            response in
            guard let weather = response.value else {
                completion(.failure(.invalidResponse))
                return
            }
            completion(.success(weather))
        }
    }
}

