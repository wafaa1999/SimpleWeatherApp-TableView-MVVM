//
//  TextTableViewCell.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 19/04/2022.
//

import UIKit

/// Text Table View Cell
class TextTableViewCell: UITableViewCell {
    
    /// Weather label
    @IBOutlet weak var weatherLabel: UILabel!
    
    /** Setup
     - Parameter representable: TextTableViewCellRepresentable.
     */
    func setup(representable: TextTableViewCellRepresentable) {
        self.weatherLabel.attributedText = representable.textOfLabel
    }
    
    /**
     Get height for the cell
     */
    class func getHeight() -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Get reuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "textCell"
    }
}
