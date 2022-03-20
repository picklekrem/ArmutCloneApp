//
//  ViewController.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        servicesData()
    }
    
    func fetchData() {
        NetworkManager.shared.getHomePageData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func servicesData() {
        NetworkManager.shared.getServiceDetails(id: 191) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

}
