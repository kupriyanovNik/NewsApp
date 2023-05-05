//
//  ContentView.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: SpaceApi
    var body: some View {
        NavigationStack {
            VStack {
                NewsView()
            }
            .refreshable {
                self.model.getData()
            }
            .navigationTitle("Space News")
            .onAppear {
                model.getData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SpaceApi())
    }
}
