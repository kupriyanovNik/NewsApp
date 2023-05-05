//
//  NewArticle.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import SwiftUI
import Kingfisher

struct NewArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    let when: String
    let url: String 
    
    let mainCalendar: Calendar
    
    var dateTime: String {
        let components = mainCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: when.toDate()!)
        return "\(components.day!).\(components.month!).\(components.year!) at \(components.hour!):\(components.minute!)"
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .contextMenu {
                    Button {
                        UIApplication.shared.open(URL(string: url)!)
                    } label: {
                        Label("Open in Browser", systemImage: "network")
                    }
                }
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                KFImage
                    .url(URL(string: imageUrl))
                    .fade(duration: 0.1)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text(title)
                    .font(.headline)
                    .padding(8)
                Text(summary)
                    .lineLimit(nil)
                    .font(.body)
                    .padding(8)
                Text(dateTime)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(8)
            }
        }
    }
}

//struct NewArticle_Previews: PreviewProvider {
//    static var previews: some View {
//        NewArticle()
//    }
//}
extension String {
    func toDate(_ format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
    
}
