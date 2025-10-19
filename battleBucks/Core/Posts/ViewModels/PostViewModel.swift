//
//  PostViewModel.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/18/25.
//

import Combine
import Foundation

class PostViewModel: ObservableObject {
    @Published var allPosts: [PostModel] = []
    @Published var filteredPosts: [PostModel] = []
    @Published var favoritePosts: [PostModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let postService = PostService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {

        postService.$allPosts
            .sink { [weak self] posts in
                self?.allPosts = posts
                self?.updateFilteredPosts()
                self?.updateFavoritePosts()
            }
            .store(in: &cancellables)
        
        postService.$isLoading
            .sink { [weak self] loading in
                self?.isLoading = loading
            }
            .store(in: &cancellables)
        
        postService.$errorMessage
            .sink { [weak self] error in
                self?.errorMessage = error
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.updateFilteredPosts()
            }
            .store(in: &cancellables)
    }
    
    private func updateFilteredPosts() {
        if searchText.isEmpty {
            filteredPosts = allPosts
        } else {
            filteredPosts = allPosts.filter { post in
                post.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func updateFavoritePosts() {
        favoritePosts = allPosts.filter { $0.isFavorite }
    }
    
    func toggleFavorite(for post: PostModel) {
        guard let index = allPosts.firstIndex(where: { $0.id == post.id }) else { return }
        allPosts[index] = allPosts[index].toggleFavorite()
        updateFilteredPosts()
        updateFavoritePosts()
    }
    
    func refreshPosts() {
        postService.refreshPosts()
    }
    
    func clearError() {
        errorMessage = nil
    }
}
