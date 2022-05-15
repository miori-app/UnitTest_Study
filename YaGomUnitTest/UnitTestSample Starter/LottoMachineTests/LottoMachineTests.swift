//
//  LottoMachineTests.swift
//  StrangeCalculatorTests
//
//  Created by miori Lee on 2022/05/14.
//

import XCTest
@testable import UnitTestSample

class LottoMachineTests: XCTestCase {
    var sut : LottoMachine!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = LottoMachine()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_isValidLottoNumbers호출시_6개보다적은숫자입력했을때_False를반환하는지() {
            // given
            let input = [1, 2, 3]

            // when
            let result = sut.isValidLottoNumbers(of: input)

            // then
            XCTAssertFalse(result)
        }
    
    func test_isValidLottoNumbers호출시_6개보다많은숫자입력했을때_False를반환하는지() {
        // given
        let input = [1, 2, 3, 4, 5, 6, 7]

        // when
        let result = sut.isValidLottoNumbers(of: input)

        // then
        XCTAssertFalse(result)
    }
    
    func test_isValidLottoNumbers호출시_중복된숫자없이_6개숫자입력했을때_True를반환하는지() {
       // given
       let input = [1, 2, 3, 4, 5, 6]

       // when
       let result = sut.isValidLottoNumbers(of: input)

       // then
       XCTAssertTrue(result)
   }

   func test_isValidLottoNumbers호출시_중복된숫자가있는_6개숫자입력했을때_False를반환하는지() {
       // given
       let input = [1, 2, 2, 3, 4, 5]

       // when
       let result = sut.isValidLottoNumbers(of: input)

       // then
       XCTAssertFalse(result)
   }
    
    func test_isValidLottoNumbers호출시_1보다작은수를포함하는배열전달했을때_False를반환하는지() {
        // given
        let input = [0, 3, 6, 9, 12, 15]

        // when
        let result = sut.isValidLottoNumbers(of: input)

        // then
        XCTAssertFalse(result)
    }

    func test_isValidLottoNumbers호출시_45보다큰수를포함하는배열전달했을때_False를반환하는지() {
        // given
        let input = [3, 6, 9, 12, 15, 50]

        // when
        let result = sut.isValidLottoNumbers(of: input)

        // then
        XCTAssertFalse(result)
    }

    func test_isValidLottoNumbers호출시_모든수가1부터45범위에포함되는배열전달했을때_True를반환하는지() {
        // given
        let input = [1, 5, 15, 25, 35, 45]

        // when
        let result = sut.isValidLottoNumbers(of: input)

        // then
        XCTAssertTrue(result)
    }

}
