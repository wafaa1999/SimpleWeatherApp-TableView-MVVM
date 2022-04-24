//
//  WeatherDetails.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation

/// Weather Details
struct WeatherDetails: Decodable{
    
    /// Location name
    var locationName: String?
    
    /// Temperature
    var temperature: Float?
    
    /// Icon URL
    var iconURL: String?
    
    /// Weather Status
    var weatherStatus: String?
    
    /**
     Default initialization.
     */
    init() {
        self.locationName = ""
        self.temperature = 0.0
        self.iconURL = ""
        self.weatherStatus = ""
    }
    
    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        
        /// Location.
        case location = "location"
        
        /// Current.
        case current = "current"
        
        /// Location name.
        case locationName = "name"
        
        /// Temperature.
        case temperature = "temp_c"
        
        /// Condition.
        case condition = "condition"
        
        /// Icon URL
        case iconURL = "icon"
        
        /// Weather status.
        case weatherStatus = "text"
    }

    /**
        Custom decoder.
        - Parameter decoder: as Decoder.
        */
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let location = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.locationName = try location.decodeIfPresent(String.self, forKey: .locationName)
        let current = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .current)
        self.temperature = try current.decodeIfPresent(Float.self, forKey: .temperature)
        let condition = try current.nestedContainer(keyedBy: CodingKeys.self, forKey: .condition)
        self.iconURL = try condition.decodeIfPresent(String.self, forKey: .iconURL)
        self.weatherStatus = try condition.decodeIfPresent(String.self, forKey: .weatherStatus)
    }
}
