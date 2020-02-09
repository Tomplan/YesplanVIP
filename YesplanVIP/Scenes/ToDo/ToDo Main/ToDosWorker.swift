//
//  ToDoWorker.swift
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

class ToDosWorker
{
    
    func getTasks(_ path: String) -> Promise<Tasks> {
        return firstly {
            APIClient.tasks("\(path)")
        }
            .map({$0})
    }
    
    func stringToDateShort(myDateString: String) -> String {
        if myDateString != "no deadline" {
            let dateFormatter = DateFormatter()
            let tempLocale = dateFormatter.locale // save locale temporarily
            dateFormatter.locale = Locale(identifier: "nl_BE") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: myDateString)!
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: date)
            dateFormatter.locale = tempLocale // reset the locale
            return dateString
        }
        else{
            return myDateString
        }
    }
    
    func groupToDosByDue(toDos: Tasks) -> Promise<[String : [Task]]> {
        var taskDict = [String : [Task]]()
        taskDict = Dictionary(grouping: toDos.data, by: { $0.due?.convertDateString(dateFormat: "yyyy-MM-dd")! ?? "no deadline"})
        return Promise { seal in
            seal.resolve(.fulfilled(taskDict))
        }
    }
    
    func sortToDosInEachGroupByDue(toDoDict: [String : [Task]]) -> Promise<[String : [Task]]> {
        var toDos: [String:[Task]] = [String:[Task]]()
        for (key, value) in toDoDict {
            let valueSorted = value.sorted(by: { $0.due ?? "no deadline" < $1.due ?? "no deadline" } )
            toDos[key] = valueSorted
            
        }
        return Promise { seal in
            seal.resolve(.fulfilled(toDos))
        }
    }
    
    func sortDictByDate(dictToDos: [String:[Task]]) -> Promise<[(key: String, value: [Task])]> {
        let sortedDictByDate = dictToDos.sorted(by:  { $0.0 < $1.0 })
        return Promise { seal in
            seal.resolve(.fulfilled(sortedDictByDate))
        }
    }
    
    func showErrorPopup(e:Error) { print("An error occured \(e)") }
    
}