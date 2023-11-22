//
//  TodoView.swift
//  TodoMvvm
//
//  Created by Martin Martinez on 21/11/23.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var viewModel = TodoViewModel()
    @State var taskName: String = ""
    @State var taskDescription: String = ""
    
    var body: some View {
        HStack {
            Text("To-Do App")
                .bold()
                .font(.title)
            Spacer()
            Text(viewModel.convertDateToString())
                .font(.title2)
                .bold()
        }
        ScrollView {
            
        }
        
        HStack {
            VStack {
                TextField("Add a new task!", text: $taskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Add a description", text: $taskDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button {
                viewModel.addTask(task: taskInformation(name: taskName, description: taskDescription, completed: false))
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 70, height: 80)
                    .overlay(
                        Image(systemName: "pencil.tip.crop.circle.badge.plus.fill")
                            .foregroundColor(.white)
                            .imageScale(.large)
                            .bold()
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
