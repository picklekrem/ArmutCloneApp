//
//  ViewController.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var allServicesData : [ServicesModel] = []
    var popularData : [ServicesModel] = []
    var postsData : [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HeaderTableViewCell.nib(), forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableView.register(PromotionTableViewCell.nib(), forCellReuseIdentifier: PromotionTableViewCell.identifier)
        tableView.register(AllServicesTableViewCell.nib(), forCellReuseIdentifier: AllServicesTableViewCell.identifier)
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.shared.getHomePageData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.allServicesData.append(contentsOf: model.all_services ?? [])
                    self.popularData.append(contentsOf: model.popular ?? [])
                    self.postsData.append(contentsOf: model.posts ?? [])
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
//    func servicesData() {
//        NetworkManager.shared.getServiceDetails(id: 191) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let model):
//                    print(model)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }

}
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0 :
            let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier, for: indexPath) as! HeaderTableViewCell
            headerCell.selectionStyle = .none
            return headerCell
            
        case 1 :
            let promotionCell = tableView.dequeueReusableCell(withIdentifier: PromotionTableViewCell.identifier, for: indexPath) as! PromotionTableViewCell
            promotionCell.loadData(image: UIImage(named: "evlilik.png") ?? .strokedCheckmark,
                                   title: "FIRST TIME NEWLY WEDS",
                                   description: "WEDDING PHOTOGRAPHERS FROM 540TL")
            promotionCell.selectionStyle = .none
            return promotionCell
            
        case 2 :
            let allServicesCell = tableView.dequeueReusableCell(withIdentifier: AllServicesTableViewCell.identifier, for: indexPath) as! AllServicesTableViewCell
            allServicesCell.loadData(data: allServicesData)
            allServicesCell.selectionStyle = .none
            return allServicesCell
            
        case 3 :
            
            return cell
        case 4:
            
            return cell
        default:
            break
        }
        return cell
    }
    
}

