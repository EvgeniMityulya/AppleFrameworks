//
//  ContentView.swift
//  Apple Frameworks
//
//  Created by Евгений Митюля on 7/26/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(value: framework, label: {
                        FrameworkTitleView(framework: framework)
                    })
                    .navigationDestination(for: Framework.self) { framework in
                        FrameworkDetailView(framework: framework)
                    }
                }
                .navigationTitle("🍎 Frameworks")
                
            }
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    FrameworkGridView()
}

