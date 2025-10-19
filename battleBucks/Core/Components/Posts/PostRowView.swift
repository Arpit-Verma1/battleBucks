//
//  PostRowView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/18/25.
//

import SwiftUI

struct PostRowView: View {
    let post: PostModel
    let onFavoriteToggle: () -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(post.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text("User ID: \(post.userId)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
            }
            
            Spacer()
            
            Button(action: onFavoriteToggle) {
                Image(systemName: post.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(post.isFavorite ? .red : .gray)
                    .font(.title2)
                    .scaleEffect(post.isFavorite ? 1.1 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6), value: post.isFavorite)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    VStack(spacing: 8) {
        PostRowView(
            post: PostModel(
                userId: 1,
                id: 1,
                title: "Sample Post Title",
                body: "This is a sample post body content",
                isFavorite: false
            ),
            onFavoriteToggle: {}
        )
        
        PostRowView(
            post: PostModel(
                userId: 2,
                id: 2,
                title: "Another Sample Post with a Longer Title",
                body: "This is another sample post body content",
                isFavorite: true
            ),
            onFavoriteToggle: {}
        )
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
