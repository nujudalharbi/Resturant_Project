//
//  storgeFirebase.swift
//  Resturant
//
//  Created by نجود  on 13/12/1443 AH.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

func uploadImage (image : UIImage ,  completion : @escaping (String) -> ()){
    
    
    let storge =  Storage.storage().reference()
    //تحويل الصورخ الي داتا
    let imageData = image.pngData()
    let namesImg = UUID().uuidString
    let path = storge.child("images").child("\(namesImg).png")
    let metadata = StorageMetadata()
    metadata.contentType = "image/pnp"
    path.putData(imageData! , metadata : metadata) {StorgeMeadata , error in
        if error == nil{
           print("upload ")
            path.downloadURL { imageUrl , error  in
                if error == nil{
                    print(imageUrl ?? "")
                    let url = "\(imageUrl!)"
                    completion(url)
                }
            }
            
        }
        
    }
    
}
