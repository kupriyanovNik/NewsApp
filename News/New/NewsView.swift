//
//  NewsView.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var model: SpaceApi
    let mainCalendar = Calendar.current
    var body: some View {
        List {
            ForEach(model.news) { new in
                ZStack {
                    NewArticle(title: new.title, imageUrl: new.imageUrl, siteName: new.newsSite, summary: new.summary, when: new.publishedAt, url: new.url, mainCalendar: mainCalendar)
                    
                    NavigationLink(destination: NewWebView(url: new.url)) {
                        EmptyView()
                    }
                    .frame(width: 0)
                    .opacity(0)
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(SpaceApi())
    }
}
