//
//  HourlyCollectionViewCell.swift
//  weatherAppiOS
//
//  Created by Robin George on 27/10/21.
//

import UIKit

class HourlyCollectionViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "HourlyCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
    }
    
    
}
