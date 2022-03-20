//
//  PromotionTableViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit

class PromotionTableViewCell: UITableViewCell {
    
    static let identifier = "PromotionTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PromotionTableViewCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var promotionImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.cardView()
    }
    
    func loadData(image : UIImage, title: String, description : String) {
        promotionImageView.image = image
        titleLabel.text = title
        descLabel.text = description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
