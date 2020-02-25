//
//  TextCell.swift
//  CVVM
//
//  Created by Tibor Bödecs on 2018. 04. 13..
//  Copyright © 2018. Tibor Bödecs. All rights reserved.
//

import UIKit

class TextCell: CollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
//        layer.shadowOffset = CGSize(width: -2, height: 2)
//        layer.borderColor = UIColor(r: 144, g: 144, b: 144).cgColor
        layer.borderColor = UIColor.black.cgColor
//        backgroundColor = UIColor(r: 158, g: 158, b: 158)
        backgroundColor = UIColor.orange
//        let attributedString = NSMutableAttributedString.init(string: self.textLabel.text ?? "")
//        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
//            NSRange.init(location: 0, length: attributedString.length));
//        self.textLabel.attributedText = attributedString
        self.textLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.textLabel.textColor = .lightGray
        self.textLabel.numberOfLines = 0
    }
    
    override func reset() {
        super.reset()
        
        self.textLabel.text = nil
    }
}
