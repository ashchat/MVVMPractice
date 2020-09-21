//
//  HomeTVCell.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/21/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class HomeTVCell: UITableViewCell {
    
    static let reuseIdentifier = "HomeTVCell"
    
    var model: ContactModel! {
        didSet {
            setupData()
        }
    }
    var img: UIImage? {
        didSet {
            let imageView = UIImageView(image: img)
            imageView.contentMode = .scaleAspectFill
            imageView.contentScaleFactor = 5
            imageView.clipsToBounds = true
            self.backgroundView = imageView
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        self.textLabel?.textColor = .white
        self.clipsToBounds = true
    }
    
    func setupData() {
        self.textLabel?.text = model.name
    }
    
}
