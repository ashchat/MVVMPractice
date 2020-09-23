//
//  MockHTTPManager.swift
//  MVVMPracticeTests
//
//  Created by Ashish Chatterjee on 9/23/20.
//  Copyright © 2020 Ashish Chatterjee. All rights reserved.
//

import Foundation
@testable import MVVMPractice

class MockHTTPManager: HTTPManager {
    typealias GetContactResult = Result<Data,Error>
    var getContactRes: GetContactResult?
    
    func testGetContact(completion: @escaping (GetContactResult) -> Void) {
        completion(.success(Data()))
    }
}
