//
//  TasksDetailModels.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright (c) 2018 Yesplan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum TasksDetail
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
        var task: Task
        var error: String?

    }
    struct ViewModel
    {
        struct TaskDetail: Hashable {
            var header: String
            var rows = [String()]
        }
        var sections: [TaskDetail]
    }
  }
}
