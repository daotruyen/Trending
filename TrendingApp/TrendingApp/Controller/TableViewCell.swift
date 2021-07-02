//
//  TableViewCell.swift
//  TrendingApp
//
//  Created by Tuyen on 28/06/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    var navigationView : UIViewController?
    @IBOutlet weak var ImageCell: UIImageView!
    @IBOutlet weak var ContentCell: UILabel!
    @IBOutlet weak var NumberCell: UILabel!
    @IBOutlet weak var Description: UILabel!
    
//    @IBAction func button(_ sender: Any) {
//        let listView = List()
//      self.navigationController?.pushViewController(listView, animated : true)
//        
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
