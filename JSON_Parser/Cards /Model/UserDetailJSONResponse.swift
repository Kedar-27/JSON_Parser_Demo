//
//  UserDetailJSONResponse.swift
//  JSON_Parser
//
//  Created by Kedar Sukerkar on 28/04/20.
//  Copyright © 2020 Kedar-27. All rights reserved.
//

import Foundation

// MARK: - UserDetail
struct UserDetail: Codable {
    let url: String
    let name, age, location: String
    let details: [String]
    let bodyType, userDesire: String

    enum CodingKeys: String, CodingKey {
        case url, name, age, location
        case details = "Details"
        case bodyType, userDesire
    }
}

