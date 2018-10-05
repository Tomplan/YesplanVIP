//
//  TasksModels.swift
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

enum TasksTab
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var tasks: [(key: String, value: [Task])]
        var error: String?
    }
    struct ViewModel
    {
        struct DisplayedTask {
            let date: String
            let tasks: [Task]
        }

        var displayedTasks: [DisplayedTask]
        var error: String?
    }
  }
}
