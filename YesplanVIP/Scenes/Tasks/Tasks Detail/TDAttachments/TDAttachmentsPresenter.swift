//
//  TDAttachmentsPresenter.swift
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

protocol TDAttachmentsPresentationLogic
{
    func presentSomething(response: TDAttachments.Something.Response)
}

class TDAttachmentsPresenter: TDAttachmentsPresentationLogic
{
    weak var viewController: TDAttachmentsDisplayLogic?
    var sections : [TDAttachments.Something.ViewModel.Item] = []

    // MARK: Do something
    
    func presentSomething(response: TDAttachments.Something.Response)
    {
        
            let header = "Attachments"
        
        let viewModel = TDAttachments.Something.ViewModel(sections: [TDAttachments.Something.ViewModel.Item(
            header: header,
            rows: response.taskAttachments)])
        
            viewController?.displaySomething(viewModel: viewModel)
        
    }
}
