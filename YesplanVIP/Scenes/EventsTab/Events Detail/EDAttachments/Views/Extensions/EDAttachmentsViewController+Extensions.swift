//
//  EDAttachmentsViewController+Extensions.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 11/11/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension EDAttachmentsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String? {
        return  sections[section].header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  sections[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EDAttachmentsViewCell", for: indexPath) as? EDAttachmentsViewCell {
            
            if sections.count != 0 {
                if let item = sections[indexPath.section].rows[indexPath.item] {
                cell.populate(with: item)
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"EDAttachmentsViewHeader", for: indexPath) as! EDAttachmentsViewHeader
            
            headerView.EDAttachmentsViewHeaderLabel.text = sections[indexPath.section].header
            
            headerView.backgroundColor = UIColor.darkGray
            headerView.layer.backgroundColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.borderColor = UIColor(r: 90, g: 90, b: 90).cgColor
            headerView.layer.masksToBounds = true
            headerView.layer.cornerRadius = 5
            headerView.layer.borderWidth = 4
            headerView.layer.shadowOffset = CGSize(width: -2, height: 2)
            return headerView
            
        default:
//            print("default")
            fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let model = sections[indexPath.section].rows[indexPath.item] {
            var url : URL

//            print("model: ", model)
            switch model {
            case .eventDocumentAttachment(let x):
//                print("docurl: ", x.dataurl)
                url = x.dataurl
            case .eventlinkAttachment(let x):
//                print("linkurl: ", x.dataurl)
                url = x.dataurl
            }
                      
            if let urlToGo = URL(string: "\(String(describing: url))"), !urlToGo.absoluteString.isEmpty {
                UIApplication.shared.open(urlToGo, options: [:], completionHandler: nil)
            }

        }
    }
}
