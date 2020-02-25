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
//        v.collectionView.flashScrollIndicators()
//        v.collectionView.showsVerticalScrollIndicator = true
//        v.collectionView.indicatorStyle = .white
//        v.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v.collectionView)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for view in v.subviews {
//            print("view:", view)
//            var multiCells: [MultiCell]? {
//                return view.subviews.lazy.compactMap({ $0 as? MultiCell })
//            }
//            //            print(multiCellViews)
//            for multiCell in multiCells! {
//                //                print("multiCell:", multiCell)
//                //                multiCell.backgroundColor = UIColor.purple
//                let multiCellSubviews = multiCell.subviews
//                //                print("multiCellSubviews:", multiCellSubviews )
//
//
//                for a in multiCellSubviews {
//                    //                    a.backgroundColor = UIColor.purple
//                    //                    print("a:", a)
//                    for b in a.subviews {
//                        //                        print("b:", b)
//                        var cells: [UICollectionViewCell]? {
//                            return b.subviews.lazy.compactMap({ $0 as? UICollectionViewCell })
//                        }
//                        for c in b.subviews {
//                            print("c:", c)
//
//                        }
//
//                        let last = cells?.sorted(by: { $0.frame.origin.y < $1.frame.origin.y } ).last
//                        print("last:", last?.bottomAnchor)
//                        //                        view.autoPinEdge(.bottom, to: .top, of: last!, withOffset: 0)
//                        multiCell.frame.size.height = (last?.frame.origin.y)! + (last?.frame.size.height)! + 10
//                        //                        multiCell.autoPinEdge(.bottom, to: .bottom, of: last!, withOffset: 0)
//                        //                        multiCell.auto
//                    }
//                }
//            }
//        }
    }
    

    override func viewDidLayoutSubviews() {
//        for view in v.subviews {
//            //            print("view:", view)
//            var multiCells: [MultiCell]? {
//                return view.subviews.lazy.compactMap({ $0 as? MultiCell })
//            }
//            //            print(multiCellViews)
//            for multiCell in multiCells! {
//                //                print("multiCell:", multiCell)
//                //                multiCell.backgroundColor = UIColor.purple
//                let multiCellSubviews = multiCell.subviews
//                //                print("multiCellSubviews:", multiCellSubviews )
//
//
//                for a in multiCellSubviews {
//                    //                    a.backgroundColor = UIColor.purple
//                    //                    print("a:", a)
//                    for b in a.subviews {
//                        //                        print("b:", b)
//                        var cells: [UICollectionViewCell]? {
//                            return b.subviews.lazy.compactMap({ $0 as? UICollectionViewCell })
//                        }
//                        //                        for c in b.subviews {
//                        //                            print("c:", c)
//                        //
//                        //                        }
//
//                        let last = cells?.sorted(by: { $0.frame.origin.y < $1.frame.origin.y } ).last
//                        //                        print("last:", last?.bottomAnchor)
//                        //                        view.autoPinEdge(.bottom, to: .top, of: last!, withOffset: 0)
//                        multiCell.frame.size.height = (last?.frame.origin.y)! + (last?.frame.size.height)! + 10
//                        //                        multiCell.autoPinEdge(.bottom, to: .bottom, of: last!, withOffset: 0)
//                        //                        multiCell.auto
//                    }
//                }
//            }
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {

//        for view in v.subviews {
////            print("view:", view)
//            var multiCells: [MultiCell]? {
//                return view.subviews.lazy.compactMap({ $0 as? MultiCell })
//            }
//            //            print(multiCellViews)
//            for multiCell in multiCells! {
////                print("multiCell:", multiCell)
//                //                multiCell.backgroundColor = UIColor.purple
//                let multiCellSubviews = multiCell.subviews
////                print("multiCellSubviews:", multiCellSubviews )
//
//
//                for a in multiCellSubviews {
//                    //                    a.backgroundColor = UIColor.purple
////                    print("a:", a)
//                    for b in a.subviews {
////                        print("b:", b)
//                        var cells: [UICollectionViewCell]? {
//                            return b.subviews.lazy.compactMap({ $0 as? UICollectionViewCell })
//                        }
////                        for c in b.subviews {
////                            print("c:", c)
////
////                        }
//print("ee", multiCell.collectionView.collectionViewLayout.collectionViewContentSize)
//                        let last = cells?.sorted(by: { $0.frame.origin.y < $1.frame.origin.y } ).last
//                        print("last:", last)
////                        view.autoPinEdge(.bottom, to: .top, of: last!, withOffset: 0)
//                        multiCell.frame.size.height = (last?.frame.origin.y)! + (last?.frame.size.height)! + 10
////                        multiCell.autoPinEdge(.bottom, to: .bottom, of: last!, withOffset: 0)
////                        multiCell.auto
//                        print("ee", multiCell.collectionView.collectionViewLayout.collectionViewContentSize)
//                    }
//                }
//            }
//        }
    }
//
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
