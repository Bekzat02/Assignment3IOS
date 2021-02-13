//
//  CartTableViewCell.swift
//  ShoppingList
//
//  Created by Nurba on 05.02.2021.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCart: UILabel!
    @IBOutlet weak var imageCart: UIImageView!
    @IBOutlet weak var descriptionCart: UILabel!
    @IBOutlet weak var priceCart: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
