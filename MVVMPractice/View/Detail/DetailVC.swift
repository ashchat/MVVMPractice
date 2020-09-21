//
//  DetailVC.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/21/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var imageView: UIImageView?
    var nameLabel: UILabel?
    var numberLabel: UILabel?
    var teamLabel: UILabel?
    
    var contact: ContactModel!
    
    init(_ contact: ContactModel) {
        super.init(nibName: nil, bundle: nil)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initUI() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        
    }

}
