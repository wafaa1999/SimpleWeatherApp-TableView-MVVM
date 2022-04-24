//
//  CellType.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import UIKit

/// Cell Type.
enum CellType: Equatable {
    
    /// Location name cell.
    case LocationNameCell(String)
    
    /// Status cell.
    case StatusCell(String)
    
    /// Temperature cell.
    case TemperatureCell(Float)
    
    /// Value.
    var value: String {
        switch self {
        case .TemperatureCell(let temp):
            return String(temp)
        case.LocationNameCell(let name):
            return name
        case.StatusCell(let status):
            return status
        }
    }
    
    /// Font family.
    var fontFamily: String {
        switch self {
        case .LocationNameCell:
            return "AvenirNextCondensed-Medium"
        case .StatusCell:
            return "AvenirNextCondensed-Medium"
        case .TemperatureCell(_):
            return "AvenirNextCondensed-Regular"
        }
    }
    
    /// Font size.
    var fontSize: Float{
        switch self {
        case .LocationNameCell:
            return 35.0
        case .StatusCell:
            return 25.0
        case .TemperatureCell(_):
            return 65.0
        }
    }
    
    /// Color.
    var color: UIColor {
        switch self {
        case .LocationNameCell:
            return .black
        case .StatusCell:
            return .lightGray
        case .TemperatureCell(let value):
            return value > 20 ? .red : .white
        }
    }
    
    /**
     Override equality..
     - Parameter lhs: as CellType.
     - Parameter rhs: as CellType.
     - Returns: Bool.
     */
    static func ==(lhs: CellType, rhs: CellType) -> Bool {
        switch (lhs, rhs) {
        case (let .TemperatureCell(lhsString), let .TemperatureCell(rhsString)):
            return lhsString == rhsString
            
        case (let .StatusCell(lhsString), let .StatusCell(rhsString)):
            return lhsString == rhsString
            
        case (let .LocationNameCell(lhsString), let .LocationNameCell(rhsString)):
            return lhsString == rhsString
            
        default:
            break
        }
        return false
    }
}


