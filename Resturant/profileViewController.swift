//
//  profileViewController.swift
//  Resturant
//
//  Created by نجود  on 05/01/1444 AH.
//

import UIKit
import Firebase
class profileViewController: UIViewController {
    
    
    var customer = [Customer]()
    let dbStore = Firestore.firestore()
    
    @IBOutlet weak var nameCustomer: UILabel!
    
    @IBOutlet weak var emailCustomer: UILabel!
    
    @IBOutlet weak var showComment: UILabel!
    
    
    @IBOutlet weak var commentCustomer: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
infoUser()
        // Do any additional setup after loading the view.
    }
    

   
    
    @IBAction func addCommentOrder(_ sender: Any) {
        
        let db = Firestore.firestore()
        let commentts = commentCustomer.text!
        _ = db.collection("user").document()
        UserDefaults.standard.set(commentts, forKey: "comment customer")
//
//        doc.setData(["comment customer" : commentCustomer.text!  as Any]  ) { (error) in
//                    errorLabel.isHidden = true

        
      //  }
        
    }
    
    
    
    
    func infoUser(){
        if let user = Auth.auth().currentUser?.uid{
            let ref = dbStore.collection("user").document(user)
            ref.getDocument{
                (document , error ) in
                if let document = document , document.exists{
                    
                   let dataDecripition  = document.data().map(String.init(describing: )) ?? "nil"
                    
                    self.nameCustomer.text = document.data()? ["firstName "] as? String
                    self.emailCustomer.text = document.data()? ["email"] as? String
                    
                    _ = Customer(nameCustomer :  self.nameCustomer.text ?? "", emailCustomer : self.nameCustomer.text!, comment: self.showComment.text!)
                    print ("......")
                }
                else {
                    
                    print (error?.localizedDescription as Any)
                    
                }
            }
        }
    
    }
    

}
