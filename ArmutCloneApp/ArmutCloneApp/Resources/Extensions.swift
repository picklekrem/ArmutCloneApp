//
//  Extensions.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import Foundation
import UIKit

fileprivate var selectedView : UIView?

extension UIViewController {
    func showSpinner() {
        selectedView = UIView(frame: self.view.bounds)
        selectedView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicator.center = selectedView!.center
        indicator.startAnimating()
        selectedView?.addSubview(indicator)
        self.view.addSubview(selectedView!)
    }
    
    func removeSpinner() {
        selectedView?.removeFromSuperview()
        selectedView = nil
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func dismissPage() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false)
    }
}

extension UIView {
    func roundedCorners() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func cardView() {
        self.backgroundColor = .systemBackground
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 4.0
    }
    
    func circleView() {
        self.layer.cornerRadius = self.frame.size.width/2
         self.clipsToBounds = true

        self.layer.borderColor = UIColor.black.cgColor
         self.layer.borderWidth = 2.0
    }
}
