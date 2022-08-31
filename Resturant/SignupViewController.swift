//
//  SignupViewController.swift
//  Resturant
//
//  Created by نجود  on 04/12/1443 AH.
//

import UIKit
import FirebaseAuth

import Firebase
class SignupViewController: UIViewController {

    
    @IBOutlet weak var firstName: UITextField!
    
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupClicked(_ sender: Any) {
        print( ",,,,,,")
        Register()

    }
    
    
    
    
    
    
    func Register(){
        
        
        let userName1 = firstName.text!
        let userName2 = lastName.text!
        
//--------- create new a count for user
        
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { [self] result , error  in
            
            
//------------- Check the result
            
            
            if (error == nil){
                let VC = self.storyboard?.instantiateViewController(withIdentifier: "productID") as! ProductsViewController
                self.navigationController?.show(VC, sender: self)
            
//----------------  write information user in firestore
                
                let db = Firestore.firestore()
                
                let comment = UserDefaults.standard.string(forKey: "comment customer")
                let doc = db.collection("user").document(Auth.auth().currentUser!.uid)
        
                
                doc.setData(["firstName " : userName1  ,  "lastName": userName2 , "email" : email.text! ,"comment customer" :comment, "uid" : result?.user.uid as Any]  ) { (error) in
//                    errorLabel.isHidden = true
        }
                
                print(result?.user.email ?? "no email")
            } else {
                print(error?.localizedDescription ?? "")
//
//                errorLabel.isHidden = false
            }
        
    
                }
        
        
    }
   

}
