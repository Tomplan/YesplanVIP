//
//  ToDosTabViewCell.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 3/10/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit
import Stevia
import SwipeCellKit

class ToDosTabViewCell: SwipeCollectionViewCell {
    
    
    // MARK: Properties
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    var lblName = UILabel()
    var lblDeadline = UILabel()
    var lblStart = UILabel()
    var lblAssignedTo = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         contentView.translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        fatalError("Interface Builder is not supported!")
//    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lblName.text = nil
        lblDeadline.text = "deadline: "
        lblStart.text = "start: "
        lblAssignedTo.text = nil
    }
    
    // MARK: Private methods
    private func setupComponents() {
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 4
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
        backgroundColor = UIColor(r: 158, g: 158, b: 158)
        
        sv(
            lblName
            ,lblDeadline
            ,lblStart
            ,lblAssignedTo
        )
        
        lblName.numberOfLines = 0
        lblName.font = UIFont.systemFont(ofSize: 15.0)
//        lblName.textColor = UIColor.red
        
        lblDeadline.numberOfLines = 0
        lblDeadline.font = UIFont.systemFont(ofSize: 12.0)
        lblDeadline.textColor = UIColor(r: 64, g: 64, b: 64)

        lblStart.numberOfLines = 0
        lblStart.font = UIFont.systemFont(ofSize: 12.0)
        lblDeadline.textColor = UIColor(r: 64, g: 64, b: 64)

        lblAssignedTo.numberOfLines = 0
        lblAssignedTo.font = UIFont.systemFont(ofSize: 12.0)
        lblAssignedTo.textColor = UIColor(r: 158, g: 103, b: 0)
    }
    
    private func setupConstraints() {
        
        layout(
            5
            ,|-16-lblName-16-|
            ,0
            ,|-16-lblDeadline-16-|
            ,0
            ,|-16-lblStart-16-|
            ,0
            ,|-16-lblAssignedTo-16-|
            ,5
        )
    }
    
    
    var animator: Any?
        
        var indicatorView = IndicatorView(frame: .zero)
        
        var unread = false {
            didSet {
                indicatorView.transform = unread ? CGAffineTransform.identity : CGAffineTransform.init(scaleX: 0.001, y: 0.001)
            }
        }
        
        override func awakeFromNib() {
            setupIndicatorView()
        }
        
        func setupIndicatorView() {
            indicatorView.translatesAutoresizingMaskIntoConstraints = false
            indicatorView.color = tintColor
            indicatorView.backgroundColor = .clear
            contentView.addSubview(indicatorView)
            
            let size: CGFloat = 12
            indicatorView.widthAnchor.constraint(equalToConstant: size).isActive = true
            indicatorView.heightAnchor.constraint(equalTo: indicatorView.widthAnchor).isActive = true
            indicatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
    //        indicatorView.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor).isActive = true
        }
        
        func setUnread(_ unread: Bool, animated: Bool) {
            let closure = {
                self.unread = unread
            }
            
            if #available(iOS 10, *), animated {
                var localAnimator = self.animator as? UIViewPropertyAnimator
                localAnimator?.stopAnimation(true)
                
                localAnimator = unread ? UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.4) : UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1.0)
                localAnimator?.addAnimations(closure)
                localAnimator?.startAnimation()
                
                self.animator = localAnimator
            } else {
                closure()
            }
        }
}
