//
//  EventsTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 17/09/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension EventsTabViewController: UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayedEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return displayedEvents[section].date
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if displayedEvents[section].events.count != 0 {
            return displayedEvents[section].events.count
        } else {
        return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsTabViewCell", for: indexPath) as? EventsTabViewCell {
            if displayedEvents.count != 0 {
                let event = displayedEvents[indexPath.section].events[indexPath.item]
                cell.populate(with: event)
                
                if let eventProfileId = displayedEvents[indexPath.section].events[indexPath.item].profile?.id {
                    if let eventProfileColor = displayedProfiles[eventProfileId]
                    {
                        if let bordercolor = UIColor(rgbString: eventProfileColor) {
                            cell.layer.borderColor = bordercolor.cgColor
                        } else {
                            print("invalid color specification")
                        }
                    }
                }
                
                if let eventStatusName = displayedEvents[indexPath.section].events[indexPath.item].status?.name {
                    if let eventStatusColor = displayedStatuses[eventStatusName]
                    {
                        if let backgroundColor = UIColor(rgbString: eventStatusColor) {
                            cell.backgroundColor = backgroundColor
                        } else {
                            print("invalid color specification")
                        }
                    }
                }
              
                }
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EventsTabViewHeader", for: indexPath) as! EventsTabViewHeader
           
            headerView.EventsViewHeaderLabel.text = displayedEvents[indexPath.section].date
                
            headerView.backgroundColor = UIColor.darkGray 
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
        }
    }
}
