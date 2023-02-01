//
//  ItemTableViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func get(data: Item) {
        itemImage.image = UIImage(named: data.imageName)
        itemName.text = data.itemName
        price.text = String(data.price)
    }

    
}
