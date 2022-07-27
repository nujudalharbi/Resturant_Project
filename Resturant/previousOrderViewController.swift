//
//  previousOrderViewController.swift
//  Resturant
//
//  Created by نجود  on 25/12/1443 AH.
//

import UIKit
import Firebase
class previousOrderViewController: UIViewController {
    
    
    var titleOrd = ""
    
    let dbStore = Firestore.firestore()
    var orderArr = [Products]()
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName : "previousOrderTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "previousID")
        tableView.delegate = self
        tableView.dataSource = self
     
        
        
        
        dbStore.collection("previousOrder").getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            self.orderArr.removeAll()
            for doc in snapshot.documents {
                let dict = doc.data() as [String: Any]
                let product = Products(title: dict["title"] as? String ?? ""
//                                       descrabition: dict["noteOrder"] as? String ?? "",
//                                       image: dict["image"] as? String ?? "",
//                                       price: dict["price"] as? String ?? "",
//                                       id: doc.documentID,
//                                       status: dict["status"] as? String ?? ""
                )
                
//                print("\(product),,,,,,,,,nnnnnn")
                self.orderArr.append(product)
                self.tableView.reloadData()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

  

}
extension previousOrderViewController : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return orderArr.count
    }
    
//    -----------------------
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "preID")as! previousOrderTableViewCell
      
       
       
       cell.titleOrd.text = orderArr[indexPath.row].title
//       cell.titleOrd.text = String(pro.qunatity) + " " + pro.title!
   

       

     
       

       
        return cell

    }
    
}
