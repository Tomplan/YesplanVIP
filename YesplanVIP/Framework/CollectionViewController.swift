//
//  CollectionViewController.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 11..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit
import Stevia


class CollectionViewController: UIViewController {

    var v = CollectionView()

    open var source: CollectionViewSource? = nil {
        didSet {
            self.source?.register(itemsFor: v.collectionView )

            v.collectionView.dataSource = self.source
            v.collectionView.delegate = self.source

        }
    }

    open override func loadView() {
        super.loadView()
        view = v
        v.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v.collectionView)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

//    open override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        
////        if self.isViewLoaded && self.view.window == nil {
////            self.collectionView = nil
////        }
//    }
    
    // MARK: - handle autorotation
//
//    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//
//        guard
//            let previousTraitCollection = previousTraitCollection,
//            self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass ||
//            self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass
//        else {
//            return
//        }
//
//        self.collectionView.collectionViewLayout.invalidateLayout()
//        self.collectionView.reloadData()
//    }
//
//    open override func viewWillTransition(to size: CGSize,
//                                          with coordinator: UIViewControllerTransitionCoordinator) {
//
//        super.viewWillTransition(to: size, with: coordinator)
//
//        self.collectionView.collectionViewLayout.invalidateLayout()
//        self.collectionView.bounds.size = size
//
//        coordinator.animate(alongsideTransition: { context in
//            context.viewController(forKey: UITransitionContextViewControllerKey.from)
//
//        }, completion: { [weak self] _ in
//            self?.collectionView.collectionViewLayout.invalidateLayout()
//        })
//    }
}


// ??
extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewLayout.collectionViewContentSize.width, height: collectionViewLayout.collectionViewContentSize.width)
    }

}
