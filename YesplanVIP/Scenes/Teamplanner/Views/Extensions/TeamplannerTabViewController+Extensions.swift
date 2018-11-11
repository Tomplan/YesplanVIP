//
//  TeamplannerTabViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 6/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension TeamplannerTabViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return displayedResourcebookings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return displayedResourcebookings[section].date
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if displayedResourcebookings[section].resourcebookings.count != 0 {
            return displayedResourcebookings[section].resourcebookings.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamplannerTabViewCell", for: indexPath) as? TeamplannerTabViewCell {
            if displayedResourcebookings.count != 0 {
                let resourcebooking = displayedResourcebookings[indexPath.section].resourcebookings[indexPath.item]
                cell.populate(with: resourcebooking)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"TeamplannerTabViewHeader", for: indexPath) as! TeamplannerTabViewHeader
            
            headerView.TeamplannerTabViewHeaderLabel.text = displayedResourcebookings[indexPath.section].date.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")
            
            headerView.backgroundColor = UIColor.darkGray
            headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.masksToBounds = true
            headerView.layer.cornerRadius = 5
            headerView.layer.borderWidth = 4
            headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
            return headerView
            
        default:
            print("default")
            fatalError("Unexpected element kind")
        }
    }
}
