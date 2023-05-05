//
//  NewWebView.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import Foundation
import SwiftUI
import Combine
import WebKit
import UIKit

struct NewWebView: UIViewRepresentable {
    
    var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let urlValue = url  {
            if let requestUrl = URL(string: urlValue) {
                DispatchQueue.main.async {
                    webView.load(URLRequest(url: requestUrl))
                }
            }
        }
    }
}
