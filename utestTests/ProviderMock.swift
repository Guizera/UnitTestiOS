//
//  ProviderMock.swift
//  utestTests
//
//  Created by José Alves da Cunha on 25/02/21.
//

@testable import utest

class ProviderMock: ProviderProtocol {
    
    enum Status {
        case success
        case noData
        case invalidResponse
    }
    let status: Status
    
    init(status: Status) {
        self.status = status
    }
    func getData(_ completion: @escaping ([String]?, jokeError?) -> ()) {
        switch status {
        case .invalidResponse:
            completion(nil, .invalidResponse)
        case .noData:
            completion(nil, .noData)
        case .success:
        completion(["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"], nil)
        }
    }
    
}
