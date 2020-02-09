//
//  ToDoInteractor.swift
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
import Then

protocol ToDosBusinessLogic
{
    func doSomething(request: ToDosTab.Something.Request)
}

protocol ToDosDataStore
{
    var toDosDS: [(key: String, value: [Task])]? { get set }
}

class ToDosInteractor: ToDosBusinessLogic, ToDosDataStore
{
    var presenter: ToDosPresentationLogic?
    var worker: ToDosWorker?
    var error: String?
    var toDosDS: [(key: String, value: [Task])]?

    var toDosArray: [(key: String, value: [Task])] = [(key: String, value: [Task])]()
    // MARK: Do something
    
    
    func doSomething(request: ToDosTab.Something.Request)
    
    {
        worker = ToDosWorker()
        
//        var user = "%22\(UserDefaults.standard.string(forKey: "todo_user")!)"
//        let usercode = user.removingPercentEncoding
        let string = """
            task:assignedto:\(UserDefaults.standard.string(forKey: "todo_user")!) task:status:\(UserDefaults.standard.string(forKey: "todo_status")!)
            """
        worker?.getTasks(string)
            .then((worker?.groupToDosByDue)!)
            .then((worker?.sortToDosInEachGroupByDue)!)
            .then((worker?.sortDictByDate)!)
            .done { items in
                self.toDosDS = items

                self.toDosArray = items
                let response = ToDosTab.Something.Response(
                    toDos: self.toDosArray
                    ,error: self.error
                )
                self.presenter?.presentSomething(response: response)
            }
        .catch { error in
                self.error = error.localizedDescription
                let response = ToDosTab.Something.Response(
                    toDos: self.toDosArray
                    ,error: self.error
                )
                self.presenter?.presentSomething(response: response)
        }
    }
    
//    {
//        worker = ToDosWorker()
//
//        worker?.getTasks("task:assignedto:\(UserDefaults.standard.string(forKey: "todo_user")!) task:status:\(UserDefaults.standard.string(forKey: "todo_status")!)")
//            .andThen((worker?.groupToDosByDue)!)
//            .andThen((worker?.sortToDosInEachGroupByDue)!)
//            .andThen((worker?.sortDictByDate)!)
//            .execute(onSuccess: { items in
//                self.toDosArray = items
//                let response = ToDosTab.Something.Response(
//                    toDos: self.toDosArray
//                    ,error: self.error
//                )
//                self.presenter?.presentSomething(response: response)
//            }) { error in
//                self.error = error.localizedDescription
//                let response = ToDosTab.Something.Response(
//                    toDos: self.toDosArray
//                    ,error: self.error
//                )
//                self.presenter?.presentSomething(response: response)
//        }
//    }
}
