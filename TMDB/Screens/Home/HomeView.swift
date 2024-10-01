//
//  ContentView.swift
//  TMDB
//
//  Created by Feyyaz ONUR on 1.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button  {
                Task {
                    await viewModel.getMovies()
                }
            } label: {
                Text("Get Movie")
            }
            .buttonStyle(.borderedProminent)

        }
        .padding()
    }
}

#Preview {
    HomeView()
}
