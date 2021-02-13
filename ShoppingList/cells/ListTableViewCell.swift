//
//  ListTableViewCell.swift
//  ShoppingList
//
//  Created by Nurba on 04.02.2021.
//

import UIKit

class ListTableViewCell: UITableViewCell, UITableViewDelegate {
    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceTag: UILabel!
    @IBOutlet weak var descriptionPro: UILabel!
    
    var delegate: ListViewController?
    
 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
