//
//  ListCell.swift
//  TrendingApp
//
//  Created by Tuyen on 29/06/2021.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var ImageYoutube: UIImageView!
    @IBOutlet weak var titleYoutube: UILabel!
    @IBOutlet weak var descriptionTtb: UILabel!
    @IBOutlet weak var dateYtb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
