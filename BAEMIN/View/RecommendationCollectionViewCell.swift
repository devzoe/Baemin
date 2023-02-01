//
//  RecommendationCollectionViewCell.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recommendationImage: UIImageView!
    
    @IBOutlet weak var recommendationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func get(data: Recommendation) {
        recommendationImage.image = UIImage(named: data.imageName)
        recommendationLabel.text = data.title
        
        self.recommendationImage.layer.cornerRadius = 20
        self.recommendationImage.clipsToBounds = true
    }

}
