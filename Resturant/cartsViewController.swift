//
//  cartsViewController.swift
//  Resturant
//
//  Created by نجود  on 23/12/1443 AH.
//

import UIKit
import Firebase
class cartsViewController: UIViewController {
    
    var orderArr = [Products]()

    var item = 0
    let dbStore = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName : "cartsTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "orderID")
        tableView.delegate = self
        tableView.dataSource = self
        
        
        dbStore.collection("Orders").getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            self.orderArr.removeAll()
            for doc in snapshot.documents {
                let dict = doc.data() as [String: Any]
                let product = Products(title: dict["title"] as? String ?? "",
                                       descrabition: dict["noteOrder"] as? String ?? "",
                                       image: dict["image"] as? String ?? "",
                                       price: dict["price"] as? String ?? "",
                                       id: doc.documentID,
                                       qunatity: dict["qunatity"] as? String ?? "" ,
                                       status: dict["status"] as? String ?? "-")
                self.orderArr.append(product)
    
                self.tableView.reloadData()
            }
            
        
        }
        
        
        
        // Do any additional setup after loading the view.
        
        
        
       
        
        
        
        
    }
    var tit = ""
   
    var titlless = ""
var editss = ""
    var selcet = Products()
    var previousOrderArray :  [String : Any] = [:]
    @IBAction func checkOrder(_ sender: Any) {
      
        
        
        
        for order in orderArr {
          
            let docRef = dbStore.collection("Orders").document(order.getID())
            docRef.updateData(["status" : "closed"  , "qunatity" : editss ])
            

            
            
            
            let orderDoc = dbStore.collection("Orders").document(order.id!)
            orderDoc.delete()
         
            
            
           
             previousOrderArray = ["title" : tit
                             
            ] as [String : Any]
            
            let dbRef = Firestore.firestore()
            dbRef.collection("previousOrder").addDocument(data: previousOrderArray)
            
            print ("\(tit),,,,,,,,,,,,,,,,,,,,,,,,,,,,,,")
        }
 
        
        
        print ("added to DB")
        
//
//            let dbStore = Firestore.firestore()
//
//        let orderRef = dbStore.collection("Orders").document(selcet.id! )
//
//
//            orderRef.updateData([
//                "qunatity": editss
//        ])
//        { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//
//        }
//        }
//
        
        
             
    
    }}

extension cartsViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return orderArr.count
    }
    
//    -----------------------
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "orderID")as! cartsTableViewCell
                let pro : Products
                pro = orderArr[indexPath.row ]
              
       cell.orderTitle.text = String(pro.qunatity) + " " + pro.title!
       cell.editQunatityOrder.text = String(pro.qunatity)
//       cell.edit = editss

       editss = cell.edit
       tit = cell.orderTitle.text!

//       cell.selectedOrder = selcet
       selcet = cell.selectedOrder
       
       
       
       
       
        return cell

    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "preID") as! previousOrderViewController
        let selectedCell = tableView.cellForRow(at: indexPath) as! cartsTableViewCell
                
        VC.titleOrd = tit
        print()
//        self.navigationController?.show(VC, sender: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
