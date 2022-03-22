//
//  ServicesCollectionViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit
import SDWebImage

class ServicesCollectionViewCell: UICollectionViewCell {

    static let identifier = "ServicesCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ServicesCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.roundedCorners()
    }
    func loadData(data : ServicesModel) {
        titleLabel.text = data.name
    }

}
