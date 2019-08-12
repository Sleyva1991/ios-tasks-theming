//
//  AppearanceHelper.swift
//  Tasks
//
//  Created by Steven Leyva on 8/12/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import UIKit

enum AppearanceHelper {
    
    static var limeGreen = UIColor(red: 0.63, green: 0.85, blue: 0.46, alpha: 1.00)
    static var backgroundGray = UIColor(red: 0.16, green: 0.16, blue: 0.19, alpha: 1.0)
    static var black = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.0)
    
    static func architexFont(with textStyle: UIFont.TextStyle, pointSize: CGFloat) -> UIFont {
        let font = UIFont(name: "Architext", size: pointSize)!
        
        return  UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    static func setDarkAppearnace() {
        
        UINavigationBar.appearance().tintColor = limeGreen
        UINavigationBar.appearance().backgroundColor = black
        
        UIView.appearance(whenContainedInInstancesOf: [UITableViewController.self]).backgroundColor = backgroundGray
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).textColor = AppearanceHelper.limeGreen
        UISegmentedControl.appearance().tintColor = limeGreen
        UITextView.appearance().tintColor = limeGreen
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: limeGreen]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: limeGreen]
        
    }
    static func style(button: UIButton) {
        
        button.backgroundColor = limeGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = architexFont(with: .callout, pointSize: 30)
        button.layer.cornerRadius = 8
        
        
        
    }
}
