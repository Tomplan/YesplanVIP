//
//  Shared.swift
//  MailExample
//
//  Created by Jeremy Koch
//  Copyright © 2017 Jeremy Koch. All rights reserved.
//

import UIKit

class IndicatorView: UIView {
    var color = UIColor.clear {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        color.set()
        UIBezierPath(ovalIn: rect).fill()
    }
}

enum ActionDescriptor {
    case read, unread, more, flag, trash, done, new, started, obsolete, onHold
    
    func title(forDisplayMode displayMode: ButtonDisplayMode) -> String? {
        guard displayMode != .imageOnly else { return nil }
        
        switch self {
        case .read: return "Read"
        case .unread: return "Unread"
        case .more: return "More"
        case .flag: return "Flag"
        case .trash: return "Trash"
        case .done: return "Done"
        case .new: return "New"
        case .started: return "Started"
        case .obsolete: return "Obsolete"
        case .onHold: return "OnHold"

        }
    }
    
    func image(forStyle style: ButtonStyle, displayMode: ButtonDisplayMode) -> UIImage? {
        guard displayMode != .titleOnly else { return nil }
        
        let name: String
        switch self {
        case .read: name = "Read"
        case .unread: name = "Unread"
        case .more: name = "More"
        case .flag: name = "Flag"
        case .trash: name = "Trash"
        case .done: name = "Done"
        case .new: name = "New"
        case .started: name = "Started"
        case .obsolete: name = "Obsolete"
        case .onHold: name = "Obsolete"

        }
        
    #if canImport(Combine)
        if #available(iOS 13.0, *) {
            let name: String
            switch self {
            case .read: name = "envelope.open.fill"
            case .unread: name = "envelope.badge.fill"
            case .more: name = "ellipsis.circle.fill"
            case .flag: name = "flag.fill"
            case .trash: name = "trash.fill"
            case .done: name = "done.fill"
            case .new: name = "new.fill"
            case .started: name = "started.fill"
            case .obsolete: name = "obsolete.fill"
            case .onHold: name = "onHold.fill"

            }
            
            if style == .backgroundColor {
                let config = UIImage.SymbolConfiguration(pointSize: 23.0, weight: .regular)
                return UIImage(systemName: name, withConfiguration: config)
            } else {
                let config = UIImage.SymbolConfiguration(pointSize: 22.0, weight: .regular)
                let image = UIImage(systemName: name, withConfiguration: config)?.withTintColor(.white, renderingMode: .alwaysTemplate)
                return circularIcon(with: color(forStyle: style), size: CGSize(width: 50, height: 50), icon: image)
            }
        } else {
            return UIImage(named: style == .backgroundColor ? name : name + "-circle")
        }
    #else
        return UIImage(named: style == .backgroundColor ? name : name + "-circle")
    #endif
    }
    
    func color(forStyle style: ButtonStyle) -> UIColor {
    #if canImport(Combine)
        switch self {
        case .read, .unread: return UIColor.systemBlue
        case .more:
            if #available(iOS 13.0, *) {
                if UITraitCollection.current.userInterfaceStyle == .dark {
                    return UIColor.systemGray
                }
                return style == .backgroundColor ? UIColor.systemGray3 : UIColor.systemGray2
            } else {
                return #colorLiteral(red: 0.7803494334, green: 0.7761332393, blue: 0.7967314124, alpha: 1)
            }
       case .flag: return UIColor.systemOrange
        case .trash: return UIColor.systemRed
        case .done: return UIColor(r: 230, g: 255, b: 200)
        case .new: return UIColor(r: 255, g: 200, b: 200)
        case .started: return UIColor(r: 255, g: 230, b: 200)
        case .obsolete: return UIColor(r: 165, g: 100, b: 200)
        case .onHold: return UIColor(r: 100, g: 100, b: 200)

        }
    #else
        switch self {
        case .read, .unread: return #colorLiteral(red: 0, green: 0.4577052593, blue: 1, alpha: 1)
        case .more: return #colorLiteral(red: 0.7803494334, green: 0.7761332393, blue: 0.7967314124, alpha: 1)
        case .flag: return #colorLiteral(red: 1, green: 0.5803921569, blue: 0, alpha: 1)
        case .trash: return #colorLiteral(red: 1, green: 0.2352941176, blue: 0.1882352941, alpha: 1)
        case .done: return #colorLiteral(red: 0.9019607843, green: 1, blue: 0.7843137255, alpha: 1)
        case .new: return #colorLiteral(red: 1, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        case .started: return #colorLiteral(red: 1, green: 0.9019607843, blue: 0.7843137255, alpha: 1)
        case .obsolete: return #colorLiteral(red: 0.6470588235, green: 0.3921568627, blue: 0.7843137255, alpha: 1)
        case .onHold: return #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.7843137255, alpha: 1)

        }
    #endif
    }
    
    func circularIcon(with color: UIColor, size: CGSize, icon: UIImage? = nil) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        UIBezierPath(ovalIn: rect).addClip()

        color.setFill()
        UIRectFill(rect)

        if let icon = icon {
            let iconRect = CGRect(x: (rect.size.width - icon.size.width) / 2,
                                  y: (rect.size.height - icon.size.height) / 2,
                                  width: icon.size.width,
                                  height: icon.size.height)
            icon.draw(in: iconRect, blendMode: .normal, alpha: 1.0)
        }

        defer { UIGraphicsEndImageContext() }

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
enum ButtonDisplayMode {
    case titleAndImage, titleOnly, imageOnly
}

enum ButtonStyle {
    case backgroundColor, circular
}
