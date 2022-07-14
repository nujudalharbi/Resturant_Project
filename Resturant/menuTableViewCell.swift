//
//  menuTableViewCell.swift
//  Resturant
//
//  Created by نجود  on 15/12/1443 AH.
//

import UIKit

class menuTableViewCell: UITableViewCell {
    
 
    

    @IBOutlet weak var menuImg: UIImageView!
    
    @IBOutlet weak var menuTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
}
