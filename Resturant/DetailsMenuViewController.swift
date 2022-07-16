//
//  DetailsMenuViewController.swift
//  Resturant
//
//  Created by نجود  on 17/12/1443 AH.
//

import UIKit

class DetailsMenuViewController: UIViewController {

    @IBOutlet weak var deatialImg: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var note: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func increaseCounter(_ sender: Any) {
    }
    
    
    @IBAction func decreaseCounter(_ sender: Any) {
    }
    
    @IBAction func addProduct(_ sender: Any) {
    }
}
