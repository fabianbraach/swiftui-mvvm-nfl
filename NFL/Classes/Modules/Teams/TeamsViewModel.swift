//
//  TeamsPresenter.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import SwiftUI
import Combine

class TeamsViewModel: ObservableObject {
    @Published var teamViewModels: [TeamView.Model] = []
    
    private let teamsService = TeamsService()
    
    private var teams: [Team] = []
    private var logosForTeams: [String: UIImage] = [:]
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        fetchTeams()
    }
    
    private func fetchTeams() {
        teamsService.fetchTeams()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] teams in
                    teams.forEach { team in
                        self?.fetchLogo(for: team)
                    }
                    
                    self?.teams = teams
                    self?.makeTeamViewModels()
                }
            )
            .store(in: &disposables)
    }
    
    private func fetchLogo(for team: Team) {
        guard logosForTeams[team.id] == nil else { return }
        
        teamsService.fetchLogo(for: team)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] logo in
                    self?.logosForTeams[team.id] = logo
                    self?.makeTeamViewModels()
                }
            )
            .store(in: &disposables)
    }
    
    private func makeTeamViewModels() {
        teamViewModels = teams.map { team in
            TeamView.Model(
                name: team.name,
                state: team.state,
                logo: logosForTeams[team.id] ?? UIImage(named: "ARI")
            )
        }
    }
}
