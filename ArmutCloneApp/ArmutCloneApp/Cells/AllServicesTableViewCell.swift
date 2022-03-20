//
//  AllServicesTableViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit

class AllServicesTableViewCell: UITableViewCell {
    
    static let identifier = "AllServicesTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "AllServicesTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var allServicesCollectionView: UICollectionView!
    
//    var allServicesData : ServicesModel?
    var allServicesData : [ServicesModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        allServicesCollectionView.delegate = self
        allServicesCollectionView.dataSource = self
        allServicesCollectionView.register(ServicesCollectionViewCell.nib(), forCellWithReuseIdentifier: ServicesCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AllServicesTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = allServicesCollectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.identifier, for: indexPath) as! ServicesCollectionViewCell
//        cell.loadData(data: allServicesData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
}
