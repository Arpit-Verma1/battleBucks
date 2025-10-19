//
//  PostService.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/18/25.
//

import Combine
import Foundation

class PostService: ObservableObject {
    @Published var allPosts: [PostModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var postSubscription: AnyCancellable?
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        postSubscription = NetworkManager.download(url: url)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                        self?.isLoading = false
                    })
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self?.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] posts in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                        self?.allPosts = posts
                        self?.postSubscription?.cancel()
                    })
                    
                }
            )
    }
    
    func refreshPosts() {
        self.allPosts = []
        fetchPosts()
    }
}
