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

class ToDosWorker
{
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
    
    func groupToDosByDue(toDos: Tasks) -> [String : [Task]]
    {
        var taskDict = [String : [Task]]()
        taskDict = Dictionary(grouping: toDos.data, by: { $0.due?.convertDateString(dateFormat: "yyyy-MM-dd")! ?? "no deadline"})
        return taskDict
    }
    
    func sortToDosInEachGroupByDue(toDoDict: [String : [Task]]) -> [String : [Task]]
    {
        var toDos: [String:[Task]] = [String:[Task]]()
        for (key, value) in toDoDict {
            let valueSorted = value.sorted(by: { $0.due! < $1.due! } )
            toDos[key] = valueSorted
            
        }
        return toDos
    }
    func sortDictByDate(dictToDos: [String:[Task]]) -> [(key: String, value: [Task])] {
        
        let sortedDictByDate = dictToDos.sorted(by:  { $0.0 < $1.0 })
        return sortedDictByDate
    }
    
    func showErrorPopup(e:Error) { print("An error occured \(e)") }
    
}
