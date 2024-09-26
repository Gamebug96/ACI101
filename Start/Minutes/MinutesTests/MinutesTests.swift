//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Gurditta Singh on 26/09/24.
//  Copyright © 2024 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

final class MinutesTests: XCTestCase {
    
    var entryUnderTest: Entry!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        entryUnderTest = .init("Title", "Content")
    }
    
    override func tearDownWithError() throws {
        entryUnderTest = nil
        try super.tearDownWithError()
    }
    
    func testSerialization() {
        let serializedData = FileEntryStore.serialize(entryUnderTest)
        let entry = FileEntryStore.deserialize(serializedData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
}
