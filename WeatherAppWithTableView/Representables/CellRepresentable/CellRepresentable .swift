//
//  CellRepresentable .swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 20/04/2022.
//

import Foundation
import UIKit

/// Cell Representable.
protocol CellRepresentable {
    
    /// Cell height.
    var cellHeight: CGFloat { get }
    
    /// Reuse identifier.
    var reuseIdentifier: String { get }
}
