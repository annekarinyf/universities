//
//  HttpClient.swift
//  Universities
//
//  Created by Anne Kariny Silva Freitas on 25/01/23.
//

import Foundation

protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)
}
