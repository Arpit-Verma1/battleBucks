//
//  SearchBarView.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/19/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search posts by title...", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !searchText.isEmpty {
                Button("Clear") {
                    searchText = ""
                }
                .foregroundColor(.blue)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    SearchBarView(searchText: .constant("arpit"))
}
