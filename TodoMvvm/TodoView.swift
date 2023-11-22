//
//  TodoView.swift
//  TodoMvvm
//
//  Created by Martin Martinez on 21/11/23.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var viewModel = TodoViewModel()
    
    var body: some View {
        HStack {
            Text("To-do App")
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    ContentView()
}
