//
//  UniversitiesMapper.swift
//  Universities
//
//  Created by Anne Kariny Silva Freitas on 25/01/23.
//

import Foundation

final class UniversityMapper {
    static func map(_ data: Data, from response: HTTPURLResponse) -> [University] {
        guard response.statusCode == 200,
              let root = try? JSONDecoder().decode([University].self, from: data) else {
            return []
        }
        return root
    }
}

extension University: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.webPages = try values.decodeIfPresent([URL].self, forKey: .webPages) ?? []
        self.stateProvince = try values.decodeIfPresent(String.self, forKey: .stateProvince) ?? nil
        self.alphaTwoCode = try values.decodeIfPresent(String.self, forKey: .alphaTwoCode) ?? ""
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
        self.domains = try values.decodeIfPresent([URL].self, forKey: .domains) ?? []
    }
    
    enum CodingKeys: String, CodingKey {
        case name, country, domains
        case webPages = "web_pages"
        case stateProvince = "state-province"
        case alphaTwoCode = "alpha_two_code"
    }
}
