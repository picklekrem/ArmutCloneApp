//
//  PopularTableViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    static let identifier = "PopularTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PopularTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var allPopularData : [ServicesModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(PopularDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: PopularDetailCollectionViewCell.identifier)
    }
    
    func loadData(data : [ServicesModel]) {
        allPopularData = data
        DispatchQueue.main.async {
            self.popularCollectionView.reloadData()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PopularTableViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPopularData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popularCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDetailCollectionViewCell.identifier, for: indexPath) as! PopularDetailCollectionViewCell
        popularCollCell.loadData(data: allPopularData[indexPath.row])
        return popularCollCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(allPopularData[indexPath.row].name)
    }
    
    
    
}
