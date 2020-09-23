//
//  HomeViewModel.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/20/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

protocol ContactsDelegate {
    func updateSection(_ indexSet: IndexSet)
}

class ContactViewModel {
    
    let httpManager: HTTPManager
    var contacts = [ContactModel]()
    var contactImages = [String:UIImage]()
    var delegate: ContactsDelegate?
    
    init(httpManager: HTTPManager = .shared) {
        self.httpManager = httpManager
    }

    func fetchContacts(completion: @escaping (Error?) -> Void) {
        httpManager.get(urlString: contactsURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let data):
                do {
                    self.contacts = try JSONDecoder().decode([ContactModel].self, from: data)
                    completion(nil)
                    self.fetchImages()
                } catch {
                    completion(error)
                }
            }
        }
    }
    
    func fetchImages() {
        for (index, contact) in self.contacts.enumerated() {
            httpManager.downloadImage(urlString: contact.imageURL, completionBlock: { [weak self] image, error in
                guard let self = self else { return }
                self.contactImages[contact.imageURL] = image
                DispatchQueue.main.async {
                    self.delegate?.updateSection(IndexSet(integer: index))
                }
            })
        }
    }
    
}
