//
//  fireStore.swift
//  Resturant
//
//  Created by نجود  on 13/12/1443 AH.
//

import Foundation
import Firebase
func sentDataFirestore(ID : String , DataUsers : [String : AnyObject]){
    
    let db = Firestore.firestore()
    db.collection("Pro").document(ID).setData(DataUsers)
    
}
