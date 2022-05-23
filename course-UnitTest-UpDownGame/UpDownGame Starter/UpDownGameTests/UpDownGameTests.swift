//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import XCTest
@testable import UpDownGame

class UpDownGameTests: XCTestCase {
    var sut : UpDownGame!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = UpDownGame()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_compareValue_tryCount가5이고_hitNumber이_randomValue와다를때_Lose반환하는지() {
        //given
        let hitNumber = 9
        sut.randomValue = 3
        sut.tryCount = 5
        //when
        let result = sut.compareValue(with: hitNumber)
        //then
        XCTAssertEqual(result, .Lose)
    }
    func test_compareVaule_hitNumber가_randomValue랑같을때_Win반환하는지() {
        //given
        let hitNumber = 7
        sut.randomValue = 7
        //when
        let result = sut.compareValue(with: hitNumber)
        //then
        XCTAssertEqual(result, .Win)
    }
    func test_compareValue_hitNumber가_randomVaule보다_클때_down반환하는지 () {
        //given
        let hitNumber = 9
        sut.randomValue = 7
        //when
        let result = sut.compareValue(with: hitNumber)
        //then
        XCTAssertEqual(result, .Down)
    }
    func test_compareValue_hitNumber가_randomVaule보다_작을때_up반환하는지 () {
        //given
        let hitNumber = 5
        sut.randomValue = 7
        //when
        let result = sut.compareValue(with: hitNumber)
        //then
        XCTAssertEqual(result, .Up)
    }
    func test_makeRandomValue호출시_randomValue를_잘설정해주는지() {
        // given
        let promise = expectation(description: "It makes random value") // expectation
        sut.randomValue = 50 // 기본값이 0~30에 포함되면 무조건 테스트에 통과하므로 범위에서 벗어난 값을 할당

        // when
        sut.makeRandomValue {
            // then
            XCTAssertGreaterThanOrEqual(self.sut.randomValue, 0)
            XCTAssertLessThanOrEqual(self.sut.randomValue, 30)
            promise.fulfill() // fulfill
        }

        wait(for: [promise], timeout: 10) // wait
    }
    func test_reset호출시_tryCount가0이되는지() {
        // given
        let promise = expectation(description: "It makes tryCount zero")
        sut.tryCount = 3 // 기본값인 0으로 테스트를 진행하면 무조건 테스트에 통과하므로 0이 아닌 값을 할당

        // when
        sut.reset {
            XCTAssertEqual(self.sut.tryCount, 0)
            promise.fulfill()
        }

        wait(for: [promise], timeout: 10)
    }
}
