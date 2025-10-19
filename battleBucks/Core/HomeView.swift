//
//  ContentView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/17/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var sharedViewModel = PostViewModel()
    
    var body: some View {
        TabView {
            PostListView(viewModel: sharedViewModel)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Posts")
                }
            
            FavoritesView(viewModel: sharedViewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    HomeView()
}
