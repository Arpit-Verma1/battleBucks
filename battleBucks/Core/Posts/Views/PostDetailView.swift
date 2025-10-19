//
//  PostDetailView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/18/25.
//

import SwiftUI

struct PostDetailView: View {
    let post: PostModel
    let onFavoriteToggle: (PostModel) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("User ID: \(post.userId)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("Post ID: \(post.id)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button {
                        onFavoriteToggle(post)
                    } label: {
                        Image(systemName: post.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(post.isFavorite ? .red : .gray)
                            .font(.title)
                            .scaleEffect(post.isFavorite ? 1.1 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: post.isFavorite)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.horizontal)
            
                Text(post.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                Text(post.body)
                    .font(.body)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .padding(.horizontal)
                
                Spacer(minLength: 20)
            }
            .padding(.vertical)
        }
        .navigationTitle("Post Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PostDetailView(
        post: PostModel(
            userId: 1,
            id: 1,
            title: "Sample Post Title",
            body: "This is a sample post body content.",
            isFavorite: false
        ),
        onFavoriteToggle: { _ in }
    )
}
