//
//  ContactModelTests.swift
//  MVVMPracticeTests
//
//  Created by Ashish Chatterjee on 9/23/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import XCTest
@testable import MVVMPractice

class ContactModelTests: XCTestCase {

    func testParse() {
        let json = """
            {
                "imageURL": "",
                "name": "Klay Thompson",
                "number": 11,
                "team": "Golden State Warriors"
            }
        """
        
        let contact = try! JSONDecoder().decode(ContactModel.self, from: json.data(using: .utf8)!)
        
        XCTAssertNotNil(contact)
        XCTAssertEqual(contact.name, "Klay Thompson")
    }

}
