//
//  LatestDetailCollectionViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit
import SDWebImage

class LatestDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LatestDetailCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LatestDetailCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var latestImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
    }
    
    func loadData (data : PostModel) {
        titleLabel.text = data.category
        descLabel.text = data.title
        let imageUrl = URL(string: data.image_url ?? "")
        latestImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo.circle"))
    }

}
