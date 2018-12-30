//
//  EDResourcesInteractor.swift
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

protocol EDResourcesBusinessLogic
{
    func doSomething(request: EDResources.Something.Request)
}

protocol EDResourcesDataStore
{
    var id: String! { get set }
    var name: String! { get set }
}

class EDResourcesInteractor: EDResourcesBusinessLogic, EDResourcesDataStore
{
    var presenter: EDResourcesPresentationLogic?
    var worker: EDResourcesWorker?
    var dict: [[String : [String]]] = []
    var dict2: [[String : String]] = []
    var id: String!
    var name: String!
    
    // MARK: Do something
    
    func doSomething(request: EDResources.Something.Request)
    {
        worker = EDResourcesWorker()
        worker?.getEventResourcebookings(id)
            .get { bookings in
                self.dict2 = bookings.compactMap { [$0._type : $0.id]}
            }.mapValues { booking in
                booking.id
            }.thenMap { id -> Promise<Resourcebooking> in (self.worker?.getResourcebookingId(id)!)!
                //            }.tap { item in print(item)
            }.done { resourcebookings in
                //                for res in resourcebookings {
                //                    print("res:", res.resource.name)
                //                }
                let dictResourcebookings = Dictionary(grouping: resourcebookings, by: { $0.resource.group })
                //                print(dictResourcebookings)
                let response = EDResources.Something.Response(
                    //                    resourcebookings: resourcebookings
                    dictionary: dictResourcebookings
                )
                self.presenter?.presentSomething(response: response)
                
                
                
                
                //            .get { bookings in
                //                self.dict = bookings.compactMap {
                //                    [$0.resource.name :  $0.childId] } }
                ////            .tap { item in print(item) }
                //            .flatMapValues({ (booking) -> [String] in
                //                booking.childId.compactMap {$0}
                //            })
                ////            .tap { item in print(item)}
                //
                //            .thenMap { item -> Promise<Resourcebooking> in (self.worker?.getResourcebookingId(item)!)! }
                //            .done { items in
                //                let response = EDResources.Something.Response(
                //                    dict: self.dict,
                //                    resourcebookings: items)
                //                self.presenter?.presentSomething(response: response)
                //
            }.catch { error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                //                self.present(alert, animated: true, completion: nil)
        }
    }
}