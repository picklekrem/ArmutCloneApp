//
//  LatestPostsTableViewCell.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit

class LatestPostsTableViewCell: UITableViewCell {
    
    static let identifier = "LatestPostsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LatestPostsTableViewCell", bundle: nil)
    }
    var allPostDatas : [PostModel] = []
    @IBOutlet weak var latestPostsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        latestPostsCollectionView.delegate = self
        latestPostsCollectionView.dataSource = self
        latestPostsCollectionView.register(LatestDetailCollectionViewCell.nib(), forCellWithReuseIdentifier: LatestDetailCollectionViewCell.identifier)
    }
    
    func loadData(data : [PostModel]) {
        allPostDatas = data
        DispatchQueue.main.async {
            self.latestPostsCollectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension LatestPostsTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPostDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let latestCell = latestPostsCollectionView.dequeueReusableCell(withReuseIdentifier: LatestDetailCollectionViewCell.identifier, for: indexPath) as! LatestDetailCollectionViewCell
        latestCell.loadData(data: allPostDatas[indexPath.row])
        return latestCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(allPostDatas[indexPath.row].link)
    }
    
}
