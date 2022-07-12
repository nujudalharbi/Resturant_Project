//
//  ProductsViewController.swift
//  Resturant
//
//  Created by نجود  on 04/12/1443 AH.
//

import UIKit
import Firebase
class ProductsViewController: UIViewController {

    @IBOutlet weak var NameOfProduct: UITextField!
    @IBOutlet weak var imageOfProduct: UIImageView!
    
    @IBOutlet weak var DatialsOfProduct: UITextView!
    
    
    @IBOutlet weak var PriceOfProduct: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func imageButton(_ sender: Any) {
        
        
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func AddOfProduct(_ sender: Any) {
        
        
        
        
        let dbRef = Firestore.firestore()
        

        let productArray = ["title" : NameOfProduct.text! ,
                            "price" : PriceOfProduct.text! , "descrabition" : DatialsOfProduct.text! , "image" : ""
                         
        ] as [String : Any]
        
        dbRef.collection("products").addDocument(data: productArray)
    }

}



extension ProductsViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        dismiss(animated: true, completion: nil)
        imageOfProduct.image = image
    }
    
    
    
    
    
    
    
    
    
}
