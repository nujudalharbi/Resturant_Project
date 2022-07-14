//
//  MenuViewController.swift
//  Resturant
//
//  Created by نجود  on 04/12/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import Firebase

class MenuViewController: UIViewController {
    var productList  =  [ Products ]()
    
    
    let dbStore = Firestore.firestore()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName : "menuTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "ProductID")
        tableView.rowHeight = 180
       
        dbStore.collection("Pro").addSnapshotListener { [self] snapshot, error in
            
            guard let docs = snapshot?.documents else { return }
            for doc in docs {
                if let object = doc.data() as? [String : AnyObject] {
                    if (object.count > 0) {
                        let tit = object["Name of Product"] as? String
                        let img = object["image of Product "] as? String
                        let price = object["Price of Product"] as? String
                        let desc = object["Deatails of Product"] as? String
//                        let status = object["status"] as? String
                        
                        let pro = Products(title: tit, descrabition: desc, image: img, price: price
                                          )
                        self.productList.append(pro)
                        
                        
                        
                        self.tableView.reloadData()
                        print(doc.data())
                        
                        
                        tableView.delegate = self
                        tableView.dataSource = self
                    }
                }
            }
            

        }
        
    }
    



}
extension MenuViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return productList.count
    }
    
//    -----------------------
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductID")as! menuTableViewCell
                let pro : Products
                pro = productList[indexPath.row ]
                if let imageName = pro.image {
                    if let url = URL(string: imageName) {
                        URLSession.shared.dataTask(with: url) { (data, _, _) in
                            if let data = data {
                                DispatchQueue.main.async {
                                    cell.menuImg.image = UIImage(data: data)
                                }
                            }
                        }.resume()
                    }
                }
                cell.menuTitle.text = pro.title
                
                
//  ----------------      layout cell and image
        
//        cell.viewCell.layer.cornerRadius = cell.viewCell.frame.height / 2
//
//        cell.backgroundCellImg.layer.cornerRadius = cell.backgroundCellImg.frame.height / 2
        return cell

    }
    
    
    
    
    
    
}
