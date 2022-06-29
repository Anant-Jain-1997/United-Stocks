//
//  BrowserView.swift
//  UnitedStock
//
//  Created by csuftitan on 6/27/22.
//

import SwiftUI
import SafariServices

struct BrowserView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
