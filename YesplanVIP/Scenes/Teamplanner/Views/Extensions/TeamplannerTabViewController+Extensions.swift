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
//        print("sections.count: ", sections.count)
        return sections.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
//        if let header = sections[section].header {
//            print(header)
//            return header }
//        else {
//            print("null")
//            return "niks"
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(sections[section].rows)
        if sections[section].rows.count != 0 {
            return sections[section].rows.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamplannerTabViewCell", for: indexPath) as? TeamplannerTabViewCell {
            if sections.count != 0 {
                let item = sections[indexPath.section].rows[indexPath.item]

                    cell.populate(with: item)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"TeamplannerTabViewHeader", for: indexPath) as! TeamplannerTabViewHeader
            
        if let header = sections[indexPath.section].header {
            headerView.TeamplannerTabViewHeaderLabel.text =
                header.convertDateStringShort(dateFormat: "EEEE, dd MMMM yyyy")
            }
            
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
