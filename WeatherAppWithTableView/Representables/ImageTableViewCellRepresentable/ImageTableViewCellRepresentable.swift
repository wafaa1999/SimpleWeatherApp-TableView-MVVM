//
//  ImageTableViewCellRepresentable.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 19/04/2022.
//

import Foundation
import UIKit

/// Image Table View Cell Representable.
class ImageTableViewCellRepresentable: CellRepresentable {
    
    /// Weather image url
    private(set) var weatherImageURL: URL?
    
    /// Cell height
    var cellHeight: CGFloat
    
    ///  Reuse identifier
    var reuseIdentifier: String
    
    /**
     Default initializer.
     */
    init() {
        self.weatherImageURL = URL(string: "")
        self.cellHeight = ImageTableViewCell.getHeight()
        self.reuseIdentifier = ImageTableViewCell.getReuseIdentifier()
    }
    
    /**
     Convenience init.
     - Parameter imageURL: as String.
     */
    convenience init(imageURL: String) {
        self.init()
        var url = imageURL
        url.insert(contentsOf: "https:", at: url.startIndex)
        self.weatherImageURL = URL(string: url)
    }
}
