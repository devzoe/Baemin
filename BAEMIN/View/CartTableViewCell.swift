//
//  CartTableViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/10.
//

import UIKit
class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var orderCount: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var orderStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func get(data: Cart) {
        itemImage.image = UIImage(named: data.imageName)
        itemName.text = data.itemName
        price.text = String(data.totalPrice)
        orderCount.text = String(data.orderCount)
    }
    
}
