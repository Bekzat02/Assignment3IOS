//
//  CartViewController.swift
//  ShoppingList
//
//  Created by Nurba on 05.02.2021.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var delegate:ProductViewController!
    var productName:String?
    var descrip: String?
    var priceOfProduct:String?
    var imageProduct: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCart()
        
        // Do any additional setup after loading the view.
    }
     var Cartcell = "CartTableViewCell"
    
    
    func configureCart(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Cartcell, bundle: nil), forCellReuseIdentifier: Cartcell)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cartcell, for: indexPath) as! CartTableViewCell
        
        
        cell.nameCart.text = productName
        cell.priceCart.text = priceOfProduct
        cell.descriptionCart.text = descrip
        cell.imageCart.image = imageProduct
        
        return cell
    }
    
    @IBAction func tappedBuy(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "You are successfully bought this product", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
