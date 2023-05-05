//
//  API.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import Foundation

@MainActor class SpaceApi: ObservableObject {
    @Published var news: [SpaceData] = []
    func getData() {
        guard let url = URL(string: Resources.apiKey.rawValue) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [.init(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Refresh", publishedAt: "Error")]
                }
                return
            }
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            DispatchQueue.main.async {
                self.news = spaceData
            }
        }
        task.resume()
    }
}
