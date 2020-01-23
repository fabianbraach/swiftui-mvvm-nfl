//
//  LogoRepository.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import Foundation
import Combine
import UIKit

class LogoRepository: APIRepository {
    let host = "https://static.nfl.com/"
    
    func fetchLogo(for teamAbbreviation: String) -> AnyPublisher<UIImage, Error> {
        return dataTask("static/site/img/logos/png-500x500/teams/\(teamAbbreviation).png")
            .tryMap { data in
                if let image = UIImage(data: data) {
                    return image
                } else {
                    throw URLError(.cannotParseResponse)
                }
            }
            .eraseToAnyPublisher()
    }
}
