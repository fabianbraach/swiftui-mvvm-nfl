//
//  Team.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import UIKit

struct Team: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "teamId"
        case name = "fullName"
        case state = "cityState"
        case abbreviation = "abbr"
        case type = "teamType"
    }
    
    let id: String
    let name: String
    let state: String
    let abbreviation: String
    let type: TeamType
    
    var logo: URL? {
        return URL(string: "https://static.nfl.com/static/site/img/logos/png-500x500/teams/\(abbreviation).png")
    }
}

extension Team {
    enum TeamType: String, Decodable {
        case team = "TEAM"
        case proBowl = "PRO"
    }
}
