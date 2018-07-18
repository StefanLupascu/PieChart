//
//  DetailsView.swift
//  PieChart
//
//  Created by Stefan on 12/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

class DetailsView: UIView {
    
    // MARK: - Properties
        
    private let pieChartView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        return pieChart
    }()

    private let codeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let exportButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(ColorEditor.exportButtonColor, for: .normal)
        button.setAttributedTitle(NSAttributedString(string: "Export to Sharepoint", attributes: [.font: UIFont.boldSystemFont(ofSize: Padding.f18),
                                                                                                  .foregroundColor: ColorEditor.loadingCircleColor]), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Padding.f5
        button.layer.borderWidth = Padding.f1
        button.layer.borderColor = ColorEditor.exportButtonColor.cgColor
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        codeLabel.attributedText = LabelEditor.detailsViewCodeLabelText
        typeLabel.attributedText = LabelEditor.detailsViewTypeLabelText
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    
    private func setupViews() {
        backgroundColor = ColorEditor.whiteBackgroundColor
        
        addSubview(pieChartView)
        addSubview(codeLabel)
        addSubview(typeLabel)
        addSubview(exportButton)

        pieChartView.heightAnchor.constraint(equalToConstant: Padding.f175).isActive = true
        pieChartView.topAnchor.constraint(equalTo: topAnchor, constant: Padding.f100).isActive = true
        pieChartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Padding.f100).isActive = true
        pieChartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Padding.f100).isActive = true
        
        codeLabel.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: Padding.f10).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: pieChartView.leadingAnchor).isActive = true
        codeLabel.trailingAnchor.constraint(equalTo: pieChartView.trailingAnchor).isActive = true

        typeLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: -Padding.f5).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: codeLabel.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo: codeLabel.trailingAnchor).isActive = true
        
        exportButton.heightAnchor.constraint(equalToConstant: Padding.f60).isActive = true
        exportButton.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Padding.f30).isActive = true
        exportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Padding.f20).isActive = true
        exportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Padding.f20).isActive = true
        exportButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Padding.f230).isActive = true
    }
}
