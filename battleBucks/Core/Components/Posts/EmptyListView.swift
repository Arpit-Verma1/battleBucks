//
//  EmptyListView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/19/25.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "doc.text")
                .font(.system(size: 50))
                .foregroundColor(.secondary)
            
            Text("No posts found")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("Try adjusting your search or check your connection")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
#Preview {
    EmptyListView()
}
