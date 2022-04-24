//
//  WeatherRouter+URLRequestConvertible.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import Alamofire

// Mark: - URLRequestConvertible

extension WeatherRouter: URLRequestConvertible {
    
    /**
     Return URL request
     */
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding
        var request = URLRequest(url: URL(string: url!)!)
        request.method = method
        switch method {
        case .get:
            if let getParameters = parameters as? [String: String] {
                request = try URLEncodedFormParameterEncoder()
                    .encode(getParameters, into: request)
            }
        default:
            break
        }
        return request
    }
}


