//
//  EmptyFavoritesView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/19/25.
//

import SwiftUI

struct EmptyFavoritesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No Favorites Yet")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Tap the heart icon on any post to add it to your favorites")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    EmptyFavoritesView()
}
