//
//  ViewController.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController, SelectedServiceIDProtocol, SelectedLatestPostProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var allServicesData : [ServicesModel] = []
    var popularData : [ServicesModel] = []
    var postsData : [PostModel] = []
    var detailsData : ServicesModel?
    var allPromotionData : [PromotionModel] = [
        PromotionModel(image: UIImage(named: "evlilik.png")!, title: "FIRST TIME NEWLY WEDS", description: "WEDDING PHOTOGRAPHERS FROM 540 TL", percentageAmout: "-15%", saleText: "İNDİRİM"),
        PromotionModel(image: UIImage(named: "barmen.jpeg")!, title: "BEST IN TOWN", description: "UNLIMITED COCTAİLS FROM 1440TL NIGHTLY", percentageAmout: "-25%", saleText: "İNDİRİM")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HeaderTableViewCell.nib(), forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableView.register(PromotionTableViewCell.nib(), forCellReuseIdentifier: PromotionTableViewCell.identifier)
        tableView.register(AllServicesTableViewCell.nib(), forCellReuseIdentifier: AllServicesTableViewCell.identifier)
        tableView.register(PopularTableViewCell.nib(), forCellReuseIdentifier: PopularTableViewCell.identifier)
        tableView.register(LatestPostsTableViewCell.nib(), forCellReuseIdentifier: LatestPostsTableViewCell.identifier)
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailVC" {
            if let destination = segue.destination as? DetailsViewController {
                destination.selectedDetailData = detailsData
            }
        }
    }
    
    func getSelectedSeviceId(serviceID: Int) {
        NetworkManager.shared.getServiceDetails(id: serviceID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    if model.id == nil {
                        self.makeAlert(titleInput: "Hata", messageInput: "Seçtiğiniz hizmet bulunamadı lütfen daha sonra tekrar deneyiniz.")
                    } else {
                        self.detailsData = model
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "showDetailVC", sender: nil)
                        }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getSelectedLatestPost(selectedPost: URL) {
        let vc = SFSafariViewController(url: selectedPost)
        present(vc, animated: true)
    }
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
            promotionCell.loadData(data: allPromotionData)
            promotionCell.selectionStyle = .none
            return promotionCell
            
        case 2 :
            let allServicesCell = tableView.dequeueReusableCell(withIdentifier: AllServicesTableViewCell.identifier, for: indexPath) as! AllServicesTableViewCell
            allServicesCell.loadData(data: allServicesData)
            allServicesCell.delegate = self
            allServicesCell.selectionStyle = .none
            return allServicesCell
            
        case 3 :
            let popularCell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as! PopularTableViewCell
            popularCell.loadData(data: popularData)
            popularCell.delegate = self
            return popularCell
        case 4:
            let latestPostCell = tableView.dequeueReusableCell(withIdentifier: LatestPostsTableViewCell.identifier, for: indexPath) as! LatestPostsTableViewCell
            latestPostCell.loadData(data: postsData)
            latestPostCell.delegate = self
            return latestPostCell
        default:
            break
        }
        return cell
    }
    
}

//getirde ne eksik ne katmak istersin

