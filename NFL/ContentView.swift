//
//  ContentView.swift
//  NFL
//
//  Created by Fabian Braach on 18.01.20.
//  Copyright © 2020 Fabian Braach. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Schedule")
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("Schedule")
                }.tag(0)
            
            NavigationView {
                TeamsView()
            }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Teams")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
