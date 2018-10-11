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
import ws
import then

protocol TasksBusinessLogic
{
  func doSomething(request: TasksTab.Something.Request)
}

protocol TasksDataStore
{
  //var name: String { get set }
}

class TasksInteractor: TasksBusinessLogic, TasksDataStore
{
  var presenter: TasksPresentationLogic?
  var worker: TasksWorker?
    
    var yesplan: Yesplan = Yesplan()
    var fetchedTasks: Tasks = Tasks()
    var error: String?
//    var fetchedStatuses: Statuses = Statuses()
//    var statusesArray: [Status] = [Status]()

    var tasksArray: [(key: String, value: [Task])] = [(key: String, value: [Task])]()
  // MARK: Do something
   
    
  func doSomething(request: TasksTab.Something.Request)
  {
    worker = TasksWorker()
    
    yesplan.getAll(fetchedTasks, query: "task:team:\(UserDefaults.standard.string(forKey: "tasks_team")!) task:status:\(UserDefaults.standard.string(forKey: "task_status")!)")
        .then((worker?.groupTasksByDue)!)
        .then((worker?.sortTasksInEachGroupByDue)!)
        .then((worker?.sortDictByDate)!)
        .then { result in
            print(result)
            self.tasksArray = result
        }

        .onError { e in
            // An error occured :/
            print(e)
            self.error = "\(e)"
            let response = TasksTab.Something.Response(
                tasks: self.tasksArray
                ,error: self.error
            )
            self.presenter?.presentSomething(response: response)
        }
        .finally {
            
        let response = TasksTab.Something.Response(
            tasks: self.tasksArray
//            ,statuses: self.statusesArray
            ,error: nil
        )
        self.presenter?.presentSomething(response: response)
    }
  }
}
