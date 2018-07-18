//
//  LabelEditor.swift
//  PieChart
//
//  Created by Stefan on 16/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

struct LabelEditor {
    
    // MARK: - Properties

    static let projectNumberLabelText: NSAttributedString = {
        let attributedText = NSAttributedString(string: "356", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f30)])
        return attributedText
    }()
    
    static let completedLabelText: NSAttributedString = {
        let attributedText = NSAttributedString(string: "Completed", attributes: [.foregroundColor: ColorEditor.grayColorText,
                                                                                  .font: UIFont.boldSystemFont(ofSize: Padding.f11)])
        return attributedText
    }()

    static let codeLabelText: NSAttributedString = {
        let attributedString = NSAttributedString(string: "P20180002", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f18)])
        return attributedString
    }()
    
    static let typeLabelText: NSAttributedString = {
        let attributedString = NSAttributedString(string: "HAK", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f11),
                                                                              .foregroundColor: ColorEditor.grayColorText])
        return attributedString
    }()

    static let detailsViewCodeLabelText: NSAttributedString = {
        let attributedText = NSAttributedString(string: "P20180002", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f30)])
        return attributedText
    }()

    static let detailsViewTypeLabelText: NSAttributedString = {
        let attributedText = NSAttributedString(string: "HAK", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f18),
                                                                            .foregroundColor: ColorEditor.grayColorText])
        return attributedText
    }()
    
    // MARK: - Functions
    
    static func notificationLabelText(percentage: CGFloat, message: String) -> String {
        let notificationLabelText = message + "\(percentage)%"
        
        return notificationLabelText
    }
    
}
