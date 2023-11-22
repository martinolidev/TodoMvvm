//
//  TodoModel.swift
//  TodoMvvm
//
//  Created by Martin Martinez on 21/11/23.
//

import Foundation

struct taskInformation {
    var name: String
    var description: String
    var completed: Bool
}

class TodoModel {
    var allMyTasks: [taskInformation] = []
    
    func getDate() -> Date {
        let Calendar = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        return Calendar.date!
    }
    
    func addTask(task: taskInformation) {
        allMyTasks.append(task)
    }
    
    func removeTask(task: taskInformation) {
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
