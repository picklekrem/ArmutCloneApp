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
    var iconNameArray: [String] = ["tadilat", "temizlik", "nakliyat", "tamir", "ozel_ders", "saglik", "dugun", "diger"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        allServicesCollectionView.delegate = self
        allServicesCollectionView.dataSource = self
        allServicesCollectionView.register(ServicesCollectionViewCell.nib(), forCellWithReuseIdentifier: ServicesCollectionViewCell.identifier)
    }
    
    func loadData(data : [ServicesModel]) {
        allServicesData = data
        DispatchQueue.main.async {
            self.allServicesCollectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension AllServicesTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allServicesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let serviceCell = allServicesCollectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.identifier, for: indexPath) as! ServicesCollectionViewCell
        serviceCell.loadData(data: allServicesData[indexPath.row])
        serviceCell.imageView.image = UIImage(named: iconNameArray[indexPath.row])
        return serviceCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(allServicesData[indexPath.row].name)
    }
    
}
