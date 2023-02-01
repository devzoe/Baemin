//
//  EventCollectionViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func get(data: Event) {
        eventImage.image = UIImage(named: data.name)
    }
}
