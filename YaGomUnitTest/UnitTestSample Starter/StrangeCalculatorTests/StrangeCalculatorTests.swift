//
//  StrangeCalculatorTests.swift
//  StrangeCalculatorTests
//
//  Created by miori Lee on 2022/05/13.
//

import XCTest
@testable import UnitTestSample

class StrangeCalculatorTests: XCTestCase {
    var sut : StrangeCalculator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        try super.setUpWithError()
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_addNumbers호출시_5_13_18을전달했을때_36을반환하는지() {
        //given
        let input = [5,13,18]
        //when
        let result = sut.addNumbers(of: input)
        //then
        XCTAssertEqual(result, 36)
    }

    //MARK: TDD
    
    func test_배열의모든합이홀수를반환하는지() {
        let numbers = [3]
        let result = sut.addOddNumbers(of: numbers)
        XCTAssertEqual(result, 3)
    }
    
    func test_배열이0을줄때_0을반환하는지() {
        let numbers = [0]
        let reuslt = sut.addOddNumbers(of: numbers)
        XCTAssertEqual(reuslt, 0)
    }
}
