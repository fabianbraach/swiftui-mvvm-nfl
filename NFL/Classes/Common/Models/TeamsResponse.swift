//
//  TeamsResponse.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

struct TeamsResponse: Decodable {
    let season: Int
    let teams: [Team]
}
