//
//  TeamView.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import SwiftUI

struct TeamView: View {
    @State var model: Model
    
    var body: some View {
        HStack {
            model.logo.map { logo in
                Image(uiImage: logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44)
            }
            
            VStack(alignment: .leading) {
                Text(model.state.uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color.secondaryLabel)
                
                Text(model.name)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.label)
            }
        }
    }
}

extension TeamView {
    struct Model {
        let name: String
        let state: String
        let logo: UIImage?
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView(
            model: TeamView.Model(
                name: "Arizona Cardinals",
                state: "Arizona",
                logo: UIImage(named: "ARI")
            )
        )
    }
}
