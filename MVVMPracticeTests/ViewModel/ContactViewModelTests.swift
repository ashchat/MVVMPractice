//
//  ContactViewModelTests.swift
//  MVVMPracticeTests
//
//  Created by Ashish Chatterjee on 9/23/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import XCTest
@testable import MVVMPractice

class ContactViewModelTests: XCTestCase {
    
    let data = """
        {
            "imageURL": "",
            "name": "Klay Thompson",
            "number": 11,
            "team": "Golden State Warriors"
        }
    """.data(using: .utf8)

    func testGetContacts() {
        let mockHTTP = MockHTTPManager()
        mockHTTP.getContactRes = .success(data!)
        
        let viewModel = ContactViewModel(httpManager: mockHTTP)
        viewModel.fetchContacts { [weak self] error in
            guard error == nil else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(viewModel.contacts.count, 1)
            XCTAssertEqual(viewModel.contacts.first?.name, "Klay Thompson")
        }
    }

}
