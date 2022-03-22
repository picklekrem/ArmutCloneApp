//
//  DetailsViewController.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 21.03.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var prosLabel: UILabel!
    @IBOutlet weak var avarageLabel: UILabel!
    @IBOutlet weak var jobDoneLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var firstCircleView: UIView!
    @IBOutlet weak var secondCircleLabel: UIView!
    @IBOutlet weak var thirdCircleView: UIView!
    
    var selectedDetailData : ServicesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstCircleView.circleView()
        secondCircleLabel.circleView()
        thirdCircleView.circleView()
        
        let attributedProsText: NSAttributedString = "\(selectedDetailData?.pro_count ?? 0) pros near you".attributedStringWithColor(["\(selectedDetailData?.pro_count ?? 0)"], color: UIColor.green)
        let attributedAverageText: NSAttributedString = "\(selectedDetailData?.average_rating ?? 0) avarage rating".attributedStringWithColor(["\(selectedDetailData?.average_rating ?? 0)"], color: UIColor.green)
        
        let imageUrl = URL(string: selectedDetailData?.image_url ?? "")
        detailImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo.circle"))
        
        prosLabel.attributedText = attributedProsText
        avarageLabel.attributedText = attributedAverageText
        jobDoneLabel.text = "Last month \(selectedDetailData?.completed_jobs_on_last_month ?? 0) job completed"
        priceLabel.text = "Free of charge"
        serviceLabel.text = "Service Guaranteed."
        nameLabel.text = selectedDetailData?.name
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        dismissPage()
    }
    
    @IBAction func confirmButtonClicked(_ sender: UIButton) {
    }
}
