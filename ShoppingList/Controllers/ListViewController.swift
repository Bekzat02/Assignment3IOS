//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Nurba on 04.02.2021.
//

import UIKit

class ListViewController: UIViewController{
  
    @IBOutlet weak var segmentChange: UISegmentedControl!
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        
        if collectionView.isHidden{
            collectionView.isHidden = false
            tableView.isHidden = true
        }else{
            collectionView.isHidden = true
            tableView.isHidden = false
        }
        
        
    }
    
    var cellTapped:Bool = true
        var currentRow = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = true
      
        
        tableView.isHidden = false
        configureTableView()
        
        
        arr.append(Product(ProductName: "Microwine", Description: "eofkofe efokeo", Price: 19.6))
        arr.append(Product(ProductName: "Headphones", Description: "Lorem ipsum", Price: 99.9))
        arr.append(Product(ProductName: "James", Description: "Tkmekfmkemfkekfmka", Price: 92.9))
        arr.append(Product(ProductName: "Loool", Description: "The fewoefwkoofwe baka", Price: 33.0))
        arr.append(Product(ProductName: "Lampard", Description: "Teofkoefofe", Price: 330.0))
        arr.append(Product(ProductName: "Coca cola", Description: "Teofoekfok", Price: 938.3))
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var arr = [Product]()
    var Listcell = "ListTableViewCell"
    var Blockcell = "BlockCollectionViewCell"
    
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Listcell, bundle: nil), forCellReuseIdentifier: Listcell)
        collectionView.register(UINib(nibName: Blockcell, bundle: nil), forCellWithReuseIdentifier: Blockcell)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
   
}
    

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Listcell, for: indexPath) as! ListTableViewCell
        let item = arr[indexPath.row]
        cell.delegate = self
        cell.imageUrl.image = UIImage(named: "image\(indexPath.row)")
        let priceformat = "\(item.Price ?? 0)$"
        
        cell.productName.text = item.ProductName
        cell.descriptionPro.text = item.Description
        cell.priceTag.text = priceformat
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let pvc = storyboard?.instantiateViewController(identifier: "product") as! ProductViewController
        
        let item = arr[indexPath.row]
        let priceformat = "\(item.Price ?? 0)$"
        
        pvc.delegate = self
        pvc.productItem = item.ProductName
        pvc.desc = item.Description
        pvc.price = priceformat
        pvc.imagePro = UIImage(named: "image\(indexPath.row)")! 
        
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
  
    }
    
  
    


extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let block = collectionView.dequeueReusableCell(withReuseIdentifier: Blockcell , for: indexPath) as! BlockCollectionViewCell
        let item = arr[indexPath.row]
        let priceformat = "\(item.Price ?? 0)"
        
        block.delegate = self
        block.descriptionBlock.text = item.Description
        block.nameproduct.text = item.ProductName
        block.priceBlock.text = priceformat
        block.imageBlock.image = UIImage(named: "image\(indexPath.row)")
        
        return block
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pvc = storyboard?.instantiateViewController(identifier: "product") as! ProductViewController
        
        let item = arr[indexPath.row]
        let priceformat = "\(item.Price ?? 0)"
        
        pvc.delegate = self
        pvc.productItem = item.ProductName
        pvc.desc = item.Description
        pvc.price = priceformat
        pvc.imagePro = UIImage(named: "image\(indexPath.row)")!
        
        self.navigationController?.pushViewController(pvc, animated: true)
    }

}

extension ListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

