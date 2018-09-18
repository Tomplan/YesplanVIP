//
//  EventsTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 17/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension EventsTabViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfSections section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsTabViewCell", for: indexPath) as? EventsTabViewCell {
            let event = events.data[indexPath.row]
            print(event)
            cell.populate(with: event)
        
        //        cell.backgroundColor = .cyan
            return cell
        }
        return UICollectionViewCell()
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.collectionView.frame.size.width, height: 200)
//    }
}
