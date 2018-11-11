//
//  EventsDetailViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension EventsDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  displayedEvents.count
    }

    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return "section" // displayedEvents[section].date
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if displayedEvents[section].rows.count != 0 {
            return displayedEvents[section].rows.count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsDetailViewCell", for: indexPath) as? EventsDetailViewCell {
            
            if displayedEvents.count != 0 {
                let event = displayedEvents[indexPath.section].rows[indexPath.item]
                cell.populate(with: event)
            }
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EventsDetailViewHeader", for: indexPath) as! EventsDetailViewHeader

            headerView.EventsDetailViewHeaderLabel.text =  displayedEvents[indexPath.section].name

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("rrrrrrrr")
        let model = displayedEvents[indexPath.section].rows[indexPath.item]
        print("model: ", model)
        router?.routeToSomewhere(segue: nil)
        //        router.showProduct(for: model.id)
    }
}
