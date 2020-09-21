//
//  HomeVC.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/20/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var tableView = UITableView()

    var contactViewModel = ContactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI() {
        self.view.backgroundColor = .darkGray
        
        // tableView initialization
        tableView.register(HomeTVCell.self, forCellReuseIdentifier: HomeTVCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .none
        tableView.separatorColor = .none
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        contactViewModel.fetchContacts { [weak self] contacts,error  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactViewModel.contacts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTVCell.reuseIdentifier, for: indexPath) as! HomeTVCell
        cell.model = contactViewModel.contacts[indexPath.section]
        
        // MARK: WHERE TO MAKE THIS CALL IN MVVM PROPERLY?
        HTTPManager.shared.downloadImage(urlString: cell.model.imageURL) { (image, error) in
            if let img = image {
                DispatchQueue.main.async {
                    self.contactViewModel.contactImages[cell.model.name] = img
                    cell.img = img
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.show(DetailVC(self.contactViewModel.contacts[indexPath.section]), sender: nil)
    }
}
