//
//  UserCell.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import UIKit
import Kingfisher

final class UserCell: UITableViewCell {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var countryCityLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak private var lblNameSurname: UILabel!
    
    static let identifier = "UserCell"
    static func nib() -> UINib {
        return UINib(nibName: "UserCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    private func initialize() {
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.width/2
    }
    
    func setup(model: UserModel) {
        nameSurnameLabel.text = (model.name?.first ?? String()) + " " + (model.name?.last ?? String())
        countryCityLabel.text = (model.location?.country ?? String()) + "/" + (model.location?.city ?? String())
        profilePictureImageView.setKfImage(urlStr: model.picture?.large)
    }

}





extension UIImageView {
    func setKfImage(urlStr: String?) {
        let url = URL(string: urlStr ?? String())
        self.kf.setImage(with: url,
                         placeholder: Constants.Image.placeHolder,
                             options: [.transition(.fade(1)),
                                       .cacheOriginalImage])
    }
}
