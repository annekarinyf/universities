//
//  LoadUniversitiesUseCase.swift
//  Universities
//
//  Created by Anne Kariny Silva Freitas on 25/01/23.
//

import Foundation

final class LoadUniversitiesUseCase {
    typealias Result = Swift.Result<[University], Error>
    
    private let httpClient: HTTPClient
    private let url: URL
    
    init(httpClient: HTTPClient, url: URL) {
        self.httpClient = httpClient
        self.url = url
    }
    
    func execute(completion: @escaping (Result) -> Void) {
        httpClient.get(from: url) { result in
            switch result {
            case .success((let data, let response)):
                let universities = UniversityMapper.map(data, from: response)
                completion(.success(universities))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
