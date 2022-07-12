//
//  ViewController.swift
//  Resturant
//
//  Created by نجود  on 28/11/1443 AH.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func loginClicked(_ sender: Any) {
        Login()
    }
    @IBAction func signupClicked(_ sender: Any) {
    }
    
    func Login(){
        
        //       register a count
                
                Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { result , error  in
                    
                    //            Check the result
                    
                           if (error == nil){
                               let VC = self.storyboard?.instantiateViewController(withIdentifier: "productID") as! ProductsViewController
                               self.navigationController?.show(VC, sender: self)
                               print(result?.user.email ?? "")
                               
//                               self.lbStatus.text = "successfully login"

                           }else{
                               
                               print(error?.localizedDescription ?? "")
//                               self.lbStatus.isHidden = false
//                               self.lbStatus.text = "email or password is wrong"
                               
                           }
                       }
        
    }
    
    
    
    
    
}

