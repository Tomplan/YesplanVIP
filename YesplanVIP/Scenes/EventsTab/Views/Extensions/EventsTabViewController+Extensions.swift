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
    
//    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
////        print("displayedEvents[section].event.count: ", displayedEvents[section].event.count)
//        return displayedEvents[section].date
//    }

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
                print("eventProfileId: ", eventProfileId)
                    if let eventProfileColor = displayedProfiles[eventProfileId]
                    {
                        print("eventProfileColor: ", eventProfileColor)
                        if let bordercolor = UIColor(rgbString: eventProfileColor) {
                            cell.layer.borderColor = bordercolor.cgColor
                        } else {
                            print("invalid color specification")
                        }
                    }
                }
                
                if let eventStatusName = displayedEvents[indexPath.section].events[indexPath.item].status?.name {
                    print("eventStatusName: ", eventStatusName)
                    if let eventStatusColor = displayedStatuses[eventStatusName]
                    {
                        print("eventStatusColor: ", eventStatusColor)
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
}
