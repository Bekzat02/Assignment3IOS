//
//  ProductViewController.swift
//  ShoppingList
//
//  Created by Nurba on 05.02.2021.
//

import UIKit

class ProductViewController: UIViewController {
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var LabelProduct: UILabel!
    @IBOutlet weak var DescProduct: UILabel!
    @IBOutlet weak var PriceProduct: UILabel!
    
    var delegate:ListViewController!
    var productItem:String?
    var desc: String?
    var price:String?
    var imagePro: UIImage?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageProduct.image = imagePro
        LabelProduct.text = productItem
        DescProduct.text = desc
        PriceProduct.text = price
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedAdd(_ sender: Any) {
        
        let cvc = storyboard?.instantiateViewController(identifier: "cart") as! CartViewController
        cvc.imageProduct = imagePro
        cvc.productName = productItem
        cvc.descrip = desc
        cvc.priceOfProduct = price
        self.navigationController?.pushViewController(cvc, animated: true)
    }
    

}
