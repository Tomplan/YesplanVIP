//
//  TDAttachmentsInteractor.swift
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
import PromiseKit

protocol TDAttachmentsBusinessLogic
{
    func doSomething(request: TDAttachments.Something.Request)
}

protocol TDAttachmentsDataStore
{
    var id: String! { get set }
//    var name: String! { get set }
}

class TDAttachmentsInteractor: TDAttachmentsBusinessLogic, TDAttachmentsDataStore
{
    var presenter: TDAttachmentsPresentationLogic?
    var worker: TDAttachmentsWorker?
    var id: String!

    // MARK: Do something
    
    func doSomething(request: TDAttachments.Something.Request)
    {
        worker = TDAttachmentsWorker()
        worker?.getTaskAttachments(id)

    .done { attachments in
            
                let response = TDAttachments.Something.Response(taskAttachments: attachments)
                self.presenter?.presentSomething(response: response)
//
            }.catch { error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                //                self.present(alert, animated: true, completion: nil)
        }
    }
}