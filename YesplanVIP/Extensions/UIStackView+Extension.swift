//
//  UIStackView+Extension.swift
//  YesplanVIP
//
//  Created by Techcc - FOH - Video on 14/08/18.
//  Copyright © 2018 Yesplan. All rights reserved.
//

import UIKit

extension UIView {
    func createStackView(views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }
}
