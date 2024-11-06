//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by user on 05.11.2024.
//

import XCTest
@testable import MovieQuiz

class ArrayTests: XCTestCase {
    func testGetValueInRange() throws {
        let array = [1, 2, 5, 2, 7]
        let value = array[safe: 2]
        
        XCTAssertEqual(value, 5)
        XCTAssertNotNil(value)
    }
    
    func testGetValueOutOfRange() throws {
        let array = [1, 2, 5, 2, 7]
        let value = array[safe: 9]
        XCTAssertNil(value)
    }
}
