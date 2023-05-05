//
//  NewsApp.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject var model = SpaceApi()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
