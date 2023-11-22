//
//  TodoViewModel.swift
//  TodoMvvm
//
//  Created by Martin Martinez on 21/11/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var allMyTasks: [taskInformation] = []
    @Published var date: Date
    
    private let model = TodoModel()
    
    init() {
        allMyTasks = model.allMyTasks
        date = model.getDate()
    }
    
    func convertDateToString() -> Date {
        return date
    }
    
    func addTask(task: taskInformation) {
        model.addTask(task: task)
        allMyTasks.append(task)
    }
    
    func removeTask(task: taskInformation) {
        model.removeTask(task: task)
        if let index = allMyTasks.firstIndex(where: { $0.name == task.name }) {
            allMyTasks.remove(at: index)
        }
    }
    
    func markAsCompleted(task: taskInformation) {
        if let index = allMyTasks.firstIndex(where: { $0.name == task.name }) {
            allMyTasks[index].completed = true
        }
    }
}
