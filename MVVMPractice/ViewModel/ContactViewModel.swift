//
//  HomeViewModel.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/20/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import UIKit

class ContactViewModel {
    
    var contacts = [ContactModel]()
    var contactImages = [String:UIImage]()

    func fetchContacts(completion: @escaping ([ContactModel]?,Error?) -> Void) {
        HTTPManager.shared.get(urlString: contactsURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print("failure", error)
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    self.contacts = try decoder.decode([ContactModel].self, from: data)
                    completion(self.contacts,nil)
                } catch {
                    print("Error while decoding JSON from data")
                }
            }
        }
    }
    
    func fetchImages(completion: @escaping ([String:UIImage]?,Error?) -> Void) {
        for contact in self.contacts {
            HTTPManager.shared.downloadImage(urlString: contact.imageURL) { imgResult,error  in
                if let img = imgResult {
                    self.contactImages[contact.name] = img
                }
            }
        }
        completion(self.contactImages,nil)
    }
    
}
