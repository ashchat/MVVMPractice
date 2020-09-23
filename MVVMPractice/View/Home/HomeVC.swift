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

        contactViewModel.delegate = self
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        contactViewModel.fetchContacts { [weak self] error in
            guard error == nil else {
                // do something with error
                return
            }
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
        let model = contactViewModel.contacts[indexPath.section]
        cell.model = model
        cell.img = contactViewModel.contactImages[model.imageURL]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = self.contactViewModel.contacts[indexPath.section]
        let image = self.contactViewModel.contactImages[contact.imageURL]
        self.show(DetailVC(contact, image), sender: nil)
    }
}

extension HomeVC: ContactsDelegate {
    func updateSection(_ indexSet: IndexSet) {
        tableView.reloadSections(indexSet, with: .none)
    }

}
