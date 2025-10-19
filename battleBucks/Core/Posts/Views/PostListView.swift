//
//  PostListView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/17/25.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var viewModel: PostViewModel
    @State private var selectedPost: PostModel?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                SearchBarView(searchText: $viewModel.searchText)
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                if viewModel.isLoading && viewModel.allPosts.isEmpty {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage) {
                        viewModel.clearError()
                        viewModel.refreshPosts()
                    }
                } else {
                    PostListContent(
                        posts: viewModel.filteredPosts,
                        selectedPost: $selectedPost,
                        onFavoriteToggle: viewModel.toggleFavorite
                    )
                }
            }
            .navigationTitle("Posts")
            .refreshable {
                viewModel.refreshPosts()
            }
            .navigationDestination(item: $selectedPost) { post in
                PostDetailView(post: post, onFavoriteToggle: viewModel.toggleFavorite)
            }
        }
    }
}

struct PostListContent: View {
    let posts: [PostModel]
    @Binding var selectedPost: PostModel?
    let onFavoriteToggle: (PostModel) -> Void
    
    var body: some View {
        if posts.isEmpty {
            EmptyListView()
        } else {
            List {
                ForEach(posts) { post in
                    PostRowView(post: post) {
                        onFavoriteToggle(post)
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
}

#Preview {
    PostListView(viewModel: PostViewModel())
}
