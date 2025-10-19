//
//  FavoritesView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/17/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: PostViewModel
    @State private var selectedPost: PostModel?
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.favoritePosts.isEmpty {
                    EmptyFavoritesView()
                } else {
                    List {
                        ForEach(viewModel.favoritePosts) { post in
                            PostRowView(post: post) {
                                viewModel.toggleFavorite(for: post)
                            }
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                selectedPost = post
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Favorites")
            .refreshable {
                viewModel.refreshPosts()
            }
            .navigationDestination(item: $selectedPost) { post in
                PostDetailView(post: post, onFavoriteToggle: viewModel.toggleFavorite)
            }
        }
    }
}

#Preview {
    FavoritesView(viewModel: PostViewModel())
}
