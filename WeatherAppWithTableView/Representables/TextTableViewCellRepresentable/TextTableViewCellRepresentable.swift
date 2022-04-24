//
//  TextTableViewCellRepresentable.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import UIKit

/// Text Table View Cell Representable.
class TextTableViewCellRepresentable: CellRepresentable {
    
    /// Text of label.
    private(set) var textOfLabel: NSAttributedString
    
    /// Cell height
    var cellHeight: CGFloat
    
    ///  Reuse identifier
    var reuseIdentifier: String
    
    /**
     Default initializer.
     */
    init() {
        self.textOfLabel = NSAttributedString()
        self.cellHeight = TextTableViewCell.getHeight()
        self.reuseIdentifier = TextTableViewCell.getReuseIdentifier()
    }
    
    /**
     Convenience init.
     - Parameter weatherDetails: as CellType.
     */
    convenience init(weatherDetails: CellType) {
        self.init()
        let result = setupStringAttributes(fontSize: weatherDetails.fontSize, fontFamily: weatherDetails.fontFamily, color: weatherDetails.color, stringToAddAttributes: weatherDetails.value)
        if weatherDetails == .TemperatureCell(Float(weatherDetails.value) ?? 0.0) {
            let temperatureType = setupStringAttributes(fontSize: 24.0, fontFamily: weatherDetails.fontFamily, color: weatherDetails.color, stringToAddAttributes: "℃")
            let temperature = NSMutableAttributedString()
            temperature.append(result)
            temperature.append(temperatureType)
            self.textOfLabel = temperature
        } else {
            self.textOfLabel = result
        }
    }
    
    /**
     Setup string attributes.
     - Parameter fontSize: as Float.
     - Parameter fontFamily: as String.
     - Parameter color: as UIColor.
     - Parameter string: text that will have attributes as String.
     - Returns: string to display as NSAttributedString.
     */
    private func setupStringAttributes(fontSize: Float, fontFamily: String, color: UIColor, stringToAddAttributes: String) -> NSAttributedString {
        let font = UIFont(name: fontFamily, size: CGFloat(fontSize))!
        let fontAttribute = [ NSAttributedString.Key.font: font ]
        let attributedString = NSMutableAttributedString(string: stringToAddAttributes, attributes: fontAttribute)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: 0, length: stringToAddAttributes.count))
        return attributedString
    }
}







