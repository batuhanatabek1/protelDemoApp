//
//  DetailViewController.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 9.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var countryCityLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.width/2
    }
    
    func setData(model: UserModel?) {
        DispatchQueue.main.async {
            self.nameLabel.text = "\(model?.name?.first ?? String())" + " " + "\(model?.name?.last ?? String())"
            self.phoneLabel.text = (model?.phone ?? String())
            self.countryCityLabel.text =  (model?.location?.country ?? String()) + "/" + (model?.location?.city ?? String())
            self.birthDateLabel.text = (model?.dob?.date ?? String())
            self.emailLabel.text = (model?.email ?? String())
            self.profilePictureImageView.setKfImage(urlStr: model?.picture?.large)
        }
    }
    
}
