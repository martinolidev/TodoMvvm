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
    var allMyTasks: [taskInformation] = [taskInformation(name: "text1", description: "text1", completed: false), taskInformation(name: "task2", description: "task2", completed: false)]
    
    func getDate() -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        let date = calendar.date(from: components)!
        
        return date
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
