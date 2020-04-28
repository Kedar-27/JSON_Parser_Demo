//
//  UserDetailsTableViewCell.swift
//  JSON_Parser
//
//  Created by Kedar Sukerkar on 28/04/20.
//  Copyright © 2020 Kedar-27. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()

    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()

    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Properties

    
    
    // MARK: - UIView
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupView()
        self.setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.userImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.userImageView.layer.cornerRadius = self.userImageView.frame.width / 2
        self.userImageView.layer.masksToBounds = true
    }
    
    private func setupView(){
        self.selectionStyle = .none
        
        self.addSubview(self.userImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.locationLabel)
        self.addSubview(self.ageLabel)
    }
    
    private func setupConstraints(){
            [
                self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                self.userImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
                self.userImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
                self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
                
                self.nameLabel.topAnchor.constraint(equalTo: self.userImageView.topAnchor),
                self.nameLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 10),
                
                self.ageLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
                self.ageLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
                
                self.locationLabel.centerYAnchor.constraint(equalTo: self.ageLabel.centerYAnchor),
                self.locationLabel.leadingAnchor.constraint(equalTo: self.ageLabel.trailingAnchor,constant: 6)
        
        
        ].forEach({$0.isActive = true})
    }
    
    
    func configureCell(name: String, age: String, location:String, imageURL: String){
        self.nameLabel.text = name
        self.ageLabel.text = age
        self.locationLabel.text = location
        self.userImageView.kf.setImage(with: URL(string: imageURL))
    }
    

    
    
}
