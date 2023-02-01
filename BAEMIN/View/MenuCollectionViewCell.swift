//
//  MenuCollectionViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func get(data: Menu) {
        menuImage.image = UIImage(named: data.imageName)
        menuLabel.text = data.title
    }

}
