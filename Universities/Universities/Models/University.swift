//
//  University.swift
//  Universities
//
//  Created by Anne Kariny Silva Freitas on 25/01/23.
//

import Foundation

struct University {
    let webPages: [URL]
    let stateProvince: String?
    let alphaTwoCode: String
    let name: String
    let country: String
    let domains: [URL]
    
    init(
        webPages: [URL],
        stateProvince: String?,
        alphaTwoCode: String,
        name: String,
        country: String,
        domains: [URL]
    ) {
        self.webPages = webPages
        self.stateProvince = stateProvince
        self.alphaTwoCode = alphaTwoCode
        self.name = name
        self.country = country
        self.domains = domains
    }
}
