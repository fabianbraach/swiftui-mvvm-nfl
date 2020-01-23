//
//  TeamsRepository.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import Foundation
import Combine

class TeamsRepository: NFLRepository {    
    func fetchTeams() -> AnyPublisher<TeamsResponse, Error> {
        return dataTask("feeds-rs/teams.json")
    }
}
