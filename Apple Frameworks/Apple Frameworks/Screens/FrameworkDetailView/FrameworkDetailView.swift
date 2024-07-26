//
//  FrameworkDetailView.swift
//  Apple Frameworks
//
//  Created by Евгений Митюля on 7/26/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {

            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
                .ignoresSafeArea()
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}
