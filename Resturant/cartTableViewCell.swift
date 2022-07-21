//
//  cartTableViewCell.swift
//  Resturant
//
//  Created by نجود  on 22/12/1443 AH.
//

import UIKit

class cartTableViewCell: UITableViewCell {

    @IBOutlet weak var orderImg: UIImageView!
    
    @IBOutlet weak var orderTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
