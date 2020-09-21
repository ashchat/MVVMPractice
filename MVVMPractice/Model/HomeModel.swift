//
//  HomeModel.swift
//  MVVMPractice
//
//  Created by Ashish Chatterjee on 9/21/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import Foundation

struct ContactModel: Codable, Hashable {
    
    let name: String
    let imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageURL
    }
    
}
