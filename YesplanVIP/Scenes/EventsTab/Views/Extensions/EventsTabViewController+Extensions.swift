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
        print("displayedEvents[section].event.count: ", displayedEvents[section].events.count)
        return displayedEvents[section].date
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("displayedEvents[section].event.count: ", displayedEvents[section].event.count)
        if displayedEvents[section].events.count != 0 {
//            print("this section has: \(displayedEvents[section].event.count) items")
            return displayedEvents[section].events.count
        } else {
        return 0 // displayedEvents[section].event.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("size: ", collectionView.frame.size.width)

//        print("1displayedEvents: ", displayedEvents)
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsTabViewCell", for: indexPath) as? EventsTabViewCell {
            if displayedEvents.count != 0 {
                let event = displayedEvents[indexPath.section].events[indexPath.item]
//                print("event: ", event)
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width, height: 200)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("eeeee")
//        let cellsAcross: CGFloat = 3
//        var widthRemainingForCellContent = collectionView.bounds.width
//        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
//            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
//        }
//        let cellWidth = widthRemainingForCellContent / cellsAcross
//        return CGSize(width: cellWidth, height: cellWidth)
//    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        let cellHeight: CGFloat = 200
//        let size: CGSize = CGSize(width: screenWidth, height: cellHeight)
//        return size;
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
//    }
//    if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//        layout.sectionHeadersPinToVisibleBounds = true
//    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            print("elementKindSectionHeader")

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EventsTabViewHeader", for: indexPath) as! EventsTabViewHeader
            
//            let formatter = DateFormatter()
//            formatter.timeZone = TimeZone.current
//            formatter.dateFormat = "dd-MM-yyyy"
//            
//            let dateString = formatter.string(from: displayedEvents[indexPath.section].date)
            headerView.EventsViewHeaderLabel.text = displayedEvents[indexPath.section].date
                
            headerView.backgroundColor = UIColor.darkGray  // ... YELLOW background
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
            //                return fatalError("Unexpected element kind")
        }
    }
}
