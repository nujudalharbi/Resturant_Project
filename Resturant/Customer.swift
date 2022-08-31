//
//  Customer.swift
//  Resturant
//
//  Created by نجود  on 29/12/1443 AH.
//

import Foundation
import UIKit
struct Customer {
    
    var nameCustomer : String

    var emailCustomer : String
    
    var comment : String
    
    
    var profileImg : UIImage?
    
//    ----------------------
    
    func getName() -> String{
       return nameCustomer
        
    }
    func getEmail() -> String{
        return emailCustomer
        
    }
}
