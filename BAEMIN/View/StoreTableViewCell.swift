//
//  StoreTableViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeRating: UILabel!
    @IBOutlet weak var minOrder: UILabel!
    @IBOutlet weak var tip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func get(data: Store) {
        storeImage.image = UIImage(named: data.imageName)
        storeName.text = data.storeName
        storeRating.text = data.rating
        minOrder.text = String(data.minOrder)
        tip.text = String(data.tip)
        
        self.storeImage.layer.cornerRadius = 20
        self.storeImage.clipsToBounds = true

    }
}
