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
            ForEach(viewModel.allMyTasks, id: \.name) { task in
                CardStructure(name: task.name, description: task.description)
            }
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

struct CardStructure: View {
    @ObservedObject var viewModel2 = TodoViewModel()
    
    var name: String
    var description: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.accentColor, lineWidth: 2)
            .frame(height: 80)
            .foregroundColor(.clear)
            .overlay(
                HStack{
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.title)
                            .bold()
                        Text(description)
                    }
                    Spacer()
                    Button {
                        viewModel2.removeTask(task: taskInformation(name: name, description: description, completed: true))
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "trash.slash.fill")
                                    .foregroundColor(.white)
                                    .bold()
                                    .imageScale(.large)
                            )
                    }
                }.padding()
            )

    }
}

#Preview {
    ContentView()
}
