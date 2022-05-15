//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import XCTest
@testable import UnitTestSample

class StrangeCalculatorTests: XCTestCase {
    var sut: StrangeCalculator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StrangeCalculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    // MARK: - addNumbers
    func test_addNumbers호출시_3_7_23을전달했을때_33을반환하는지() {
        // given
        let input = [3, 7, 23]
        
        // when
        let result = sut.addNumbers(of: input)
        
        // then
        XCTAssertEqual(result, 33)
    }
}
