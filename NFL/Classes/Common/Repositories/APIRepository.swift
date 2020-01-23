//
//  APIRepository.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import Foundation
import Combine

protocol APIRepository {
    var session: URLSession { get }
    var host: String { get }
}

extension APIRepository {
    var session: URLSession {
        let session = URLSession.shared
        session.configuration.urlCache = .shared
        
        return session
    }
    
    func dataTask(
        _ path: String,
        method: HTTPMethod = .get
    ) -> AnyPublisher<Data, Error> {
        guard let baseURL = URL(string: host) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
                
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return session.dataTaskPublisher(for: urlRequest)
            .mapError { error in
                error as Error
            }
            .map { output in
                output.data
            }
            .eraseToAnyPublisher()
    }
    
    func dataTask<T: Decodable>(
        _ path: String,
        method: HTTPMethod = .get
    ) -> AnyPublisher<T, Error> {
        let dataTask: AnyPublisher<Data, Error> = self.dataTask(path, method: method)
        
        return dataTask
            .flatMap(maxPublishers: .max(1)) { data in
                self.decode(data)
            }
            .eraseToAnyPublisher()
    }
    
    private func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, Error> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
