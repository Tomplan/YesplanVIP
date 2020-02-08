//
//  TasksInteractor.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 13/08/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PromiseKit
//import PromiseKit

protocol TasksBusinessLogic
{
  func getTasks(request: TasksTab.Something.Request)
}

protocol TasksDataStore
{
var tasksDS: [(key: String, value: [Task])]? { get set }
}

class TasksInteractor: TasksBusinessLogic, TasksDataStore
{
  var presenter: TasksPresentationLogic?
  var worker: TasksWorker?
    
    var error: String?
    var tasksDS: [(key: String, value: [Task])]?
    var tasksArray: [(key: String, value: [Task])] = [(key: String, value: [Task])]()
    
  // MARK: Do something
    
  func getTasks(request: TasksTab.Something.Request)
  {
    worker = TasksWorker()
    
    worker?
        .getTasks("task:team:\(UserDefaults.standard.string(forKey: "tasks_team")!) task:status:\(UserDefaults.standard.string(forKey: "task_status")!)")
        
        .then((worker?.groupTasksByDue)!)
        .then((worker?.sortTasksInEachGroupByDue)!)
        .then((worker?.sortDictByDate)!)
        .done { items in
            self.tasksDS = items
            self.tasksArray = items
            let response = TasksTab.Something.Response(
                tasks: self.tasksArray
                ,error: self.error
            )
            self.presenter?.presentSomething(response: response)
        }
    .catch { error in
            self.error = error.localizedDescription
            let response = TasksTab.Something.Response(
                tasks: self.tasksArray
                ,error: self.error
            )
            self.presenter?.presentSomething(response: response)
        }
    }
}
