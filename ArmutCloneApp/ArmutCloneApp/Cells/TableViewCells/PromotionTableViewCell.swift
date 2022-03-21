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

    @IBOutlet weak var promotionCollectionView: UICollectionView!
    var allPromotionDatas : [PromotionModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        promotionCollectionView.delegate = self
        promotionCollectionView.dataSource = self
        promotionCollectionView.register(PromotionCollectionViewCell.nib(), forCellWithReuseIdentifier: PromotionCollectionViewCell.identifier)
    }
    
    func loadData(data : [PromotionModel]) {
        allPromotionDatas = data
        DispatchQueue.main.async {
            self.promotionCollectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension PromotionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPromotionDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let promotionCell = promotionCollectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.identifier, for: indexPath) as! PromotionCollectionViewCell
        promotionCell.loadData(data: allPromotionDatas[indexPath.row])
        return promotionCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
    }
}
