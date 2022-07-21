//
//  cartViewController.swift
//  Resturant
//
//  Created by نجود  on 22/12/1443 AH.
//

import UIKit
import Firebase
class cartViewController: UIViewController {

    var orderArr = [Products]()

    var item = 0
    let dbStore = Firestore.firestore()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName : "cartTableViewCell", bundle : nil ) ,forCellReuseIdentifier: "orderID")
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
    }
    


}




extension cartViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return orderArr.count
    }
    
//    -----------------------
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "orderID")as! cartTableViewCell
                let pro : Products
                pro = orderArr[indexPath.row ]
                if let imageName = pro.image {
                    if let url = URL(string: imageName) {
                        URLSession.shared.dataTask(with: url) { (data, _, _) in
                            if let data = data {
                                DispatchQueue.main.async {
                                    cell.orderImg.image = UIImage(data: data)
                                }
                            }
                        }.resume()
                    }
                }
//                cell.orderTitle.text = pro.title
                
                
//  ----------------      layout cell and image
        
//        cell.viewCell.layer.cornerRadius = cell.viewCell.frame.height / 2
//
//        cell.backgroundCellImg.layer.cornerRadius = cell.backgroundCellImg.frame.height / 2
        return cell

    }
}
