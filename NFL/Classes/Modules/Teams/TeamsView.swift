//
//  TeamsView.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import SwiftUI

struct TeamsView: View {
    @EnvironmentObject var viewModel: TeamsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.teamViewModels, id: \.name) { model in
                CardView {
                    TeamView(model: model)
                }
            }
        }
        .background(Color.secondarySystemBackground)
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        .navigationBarTitle("Teams")
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView().environmentObject(TeamsViewModel())
    }
}
