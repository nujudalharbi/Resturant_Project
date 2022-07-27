//
//  cartsTableViewCell.swift
//  Resturant
//
//  Created by نجود  on 23/12/1443 AH.
//

import UIKit
import Firebase

class cartsTableViewCell: UITableViewCell {
    
    
    
    var counter = 0
    var selectedOrder = Products()
    
var edit = ""
    let dbStore = Firestore.firestore()
    
    
    
    
    
    
    @IBOutlet weak var orderImg: UIImageView!
    
    @IBOutlet weak var orderTitle: UILabel!
    
    @IBOutlet weak var editQunatityOrder: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func editIncrease(_ sender: Any) {
        
       
//
//        let orderRef = dbStore.collection("Orders").document(selectedOrder.id! )
//
//
//            orderRef.updateData([
//                "qunatity": editQunatityOrder.text
//        ])
//        { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//
//
//
//                print("Document successfully updated")
//
//        }
//        }
        


        counter += 1
        editQunatityOrder.text = String (counter)
        edit = editQunatityOrder.text!


      
     
        
        
        
    }
    
    
    @IBAction func editDecrease(_ sender: Any) {
    }
    
   
    
}



