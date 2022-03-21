//
//  PopularDetailCollectionViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit
import SDWebImage

class PopularDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularDetailCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PopularDetailCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var popularImageView: UIImageView!
    @IBOutlet weak var popularTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.roundedCorners()
    }
    
    func loadData(data : ServicesModel) {
        popularTitleLabel.text = data.name
        let imageUrl = URL(string: data.image_url ?? "")
        popularImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo.circle"))
    }

}
