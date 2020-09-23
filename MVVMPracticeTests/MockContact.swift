//
//  MockContact.swift
//  MVVMPracticeTests
//
//  Created by Ashish Chatterjee on 9/23/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import Foundation
@testable import MVVMPractice

extension ContactModel {
    static func with(name: String = "Klay Thompson",
                number: Int = 11,
                team: String = "Golden State Warriors",
                imageURL: String = "") -> ContactModel {
        return ContactModel(name: name,
                            number: number,
                            team: team,
                            imageURL: imageURL)
    }
}
