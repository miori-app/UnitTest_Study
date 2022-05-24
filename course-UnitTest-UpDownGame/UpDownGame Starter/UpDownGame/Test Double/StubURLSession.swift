//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import Foundation

//MARK: URLSession이 네트워킹을 통해 받아와서 처리하는 data, response, error를 직접 만들어서 담아주기 위한 구조체입니
struct DummyData {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    var completionHandler: DataTaskCompletionHandler? = nil
    
    func completion() {
        completionHandler?(data, response, error)
    }
}

//MARK: 테스트 중에 URLSession을 대체할 객체
class StubURLSession: URLSessionProtocol {
    var dummyData: DummyData?
    
    init(dummy: DummyData) {
        self.dummyData = dummy
    }

    func dataTask(with url: URL, completionHandler: @escaping DataTaskCompletionHandler) -> URLSessionDataTask {
        return StubURLSessionDataTask(dummy: dummyData, completionHandler: completionHandler)
    }
}

//MARK: URLSessionDataTask를 상속받은 객체로 테스트 중에 URLSessionDataTask를 대체할 객체
class StubURLSessionDataTask: URLSessionDataTask {
    var dummyData: DummyData?
    
    init(dummy: DummyData?, completionHandler: DataTaskCompletionHandler?) {
        self.dummyData = dummy
        self.dummyData?.completionHandler = completionHandler
    }
    
    override func resume() {
        dummyData?.completion()
    }
}
