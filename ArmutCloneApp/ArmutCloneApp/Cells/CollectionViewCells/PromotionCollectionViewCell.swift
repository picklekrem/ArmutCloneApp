//
//  PromotionCollectionViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromotionCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PromotionCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var saleView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var promotionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
        saleView.roundedCorners()
    }
    
    func loadData(data : PromotionModel) {
        promotionImageView.image = data.image
        titleLabel.text = data.title
        descLabel.text = data.description
        percentageLabel.text = data.percentageAmout
        saleLabel.text = data.saleText
    }

}
