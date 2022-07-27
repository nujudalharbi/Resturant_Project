//
//  DetailsMenuViewController.swift
//  Resturant
//
//  Created by نجود  on 17/12/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
class DetailsMenuViewController: UIViewController {

    
    var titleRest = ""
    var descriptionRest  = ""
    var price = ""
    var counter = 0
    
    var imageDetails: UIImage?
    
    var orderArr = [Products]()
    
    
    
    
    
    
    
    @IBOutlet weak var deatialImg: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var note: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTitle.text = titleRest
    
        details.text = descriptionRest
    
        
        
        if let imageDetails = imageDetails {
            self.deatialImg.image = imageDetails

        }
//        counterLabel.text = String(price)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func increaseCounter(_ sender: Any) {
        
        counter += 1
        counterLabel.text = String (counter)
    }
    
    
    @IBAction func decreaseCounter(_ sender: Any) {

        if (counter == 0){
            return counterLabel.text = String (counter)
        }else{
        counter -= 1
      return counterLabel.text = String (counter)
       }
        
    }
    
    @IBAction func addProduct(_ sender: Any) {
        let dbRef = Firestore.firestore()
        
       // let tableNum = UserDefaults.standard.string(forKey: "tablenum")
    //  let payment = UserDefaults.standard.string(forKey: "payment")
        let orderArray = ["title" : detailTitle.text! ,
                          "noteOrder" : note.text! , "qunatity" : counterLabel.text! , "status" : "open",
                          "tableNum" : "" ,  "payment" : "" , "image" : imageDetails?.images
        ] as [String : Any]
        
        dbRef.collection("Orders").addDocument(data: orderArray)
        
        print ("added to DB")
        
        
        
        
    }
}
