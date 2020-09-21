//
//  DetailVC.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/21/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var image: UIImage?
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    var teamLabel: UILabel!
    
    var contact: ContactModel!
    
    init(_ contact: ContactModel,_ image: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        self.contact = contact
        self.image = image
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initUI() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
//        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        self.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)
        ])
        
        nameLabel = UILabel()
        nameLabel.text = contact.name
        nameLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        nameLabel.textColor = .white
        self.view.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.bottomAnchor),
            nameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])

        teamLabel = UILabel()
        teamLabel.text = contact.team
        teamLabel.font = .systemFont(ofSize: 14, weight: .regular)
        teamLabel.textColor = .white
        self.view.addSubview(teamLabel)
        
        teamLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            teamLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            teamLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            teamLabel.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor),
            teamLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])

        numberLabel = UILabel()
        numberLabel.text = "#\(contact.number)"
        numberLabel.font = .systemFont(ofSize: 30, weight: .medium)
        numberLabel.textColor = .white
        self.view.addSubview(numberLabel)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            numberLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            numberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            numberLabel.topAnchor.constraint(equalTo: teamLabel.safeAreaLayoutGuide.bottomAnchor),
            numberLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15)
        ])
    }

}
