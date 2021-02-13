//
//  BlockCollectionViewCell.swift
//  ShoppingList
//
//  Created by Nurba on 04.02.2021.
//

import UIKit

class BlockCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    @IBOutlet weak var imageBlock: UIImageView!
    @IBOutlet weak var nameproduct: UILabel!
    @IBOutlet weak var descriptionBlock: UILabel!
    @IBOutlet weak var priceBlock: UILabel!
    
    var delegate: ListViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
