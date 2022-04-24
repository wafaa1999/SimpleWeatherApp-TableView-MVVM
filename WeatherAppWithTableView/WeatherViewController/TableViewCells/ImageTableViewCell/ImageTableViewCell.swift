//
//  ImageTableViewCell.swift
//  WeatherAppWithTableView
//
//  Created by Wafaa Dwikat on 19/04/2022.
//

import UIKit
import SDWebImage

/// Image Table View Cell.
class ImageTableViewCell: UITableViewCell {
    
    /// Status image.
    @IBOutlet weak var statusImage: SDAnimatedImageView!
    
    /** Setup
     - Parameter representable: ImageTableViewCellRepresentable
     */
    func setup(representable: ImageTableViewCellRepresentable) {
        statusImage.sd_setImage(with: representable.weatherImageURL,  completed: nil)
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
        return "imageCell"
    }
}
