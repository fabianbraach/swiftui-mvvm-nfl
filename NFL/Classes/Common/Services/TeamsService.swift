//
//  TeamsService.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import Combine
import UIKit

class TeamsService {
    private let teamsRepository = TeamsRepository()
    private let logoRepository = LogoRepository()
    
    func fetchTeams() -> AnyPublisher<[Team], Error> {
        return teamsRepository.fetchTeams()
            .map { response in
                response.teams
            }
            .map { teams in
                teams.filter { $0.type == .team }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchLogo(for team: Team) -> AnyPublisher<UIImage, Error> {
        return logoRepository.fetchLogo(for: team.abbreviation)
    }
}
