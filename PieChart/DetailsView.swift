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
    
    private let projectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private let exportButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(ColorEditor.exportButtonColor, for: .normal)
        button.setTitle("Export to Sharepoint", for: .normal)
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
        
        projectLabel.attributedText = LabelEditor.detailsViewProjectLabelText
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions
    
    private func setupViews() {
        backgroundColor = ColorEditor.whiteBackgroundColor
        
        addSubview(pieChartView)
        addSubview(projectLabel)
        addSubview(exportButton)

        pieChartView.heightAnchor.constraint(equalToConstant: Padding.f175).isActive = true
        pieChartView.topAnchor.constraint(equalTo: topAnchor, constant: Padding.f100).isActive = true
        pieChartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Padding.f100).isActive = true
        pieChartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Padding.f100).isActive = true
        
        projectLabel.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: Padding.f20).isActive = true
        projectLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        projectLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        exportButton.heightAnchor.constraint(equalToConstant: Padding.f60).isActive = true
        exportButton.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: Padding.f30).isActive = true
        exportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Padding.f20).isActive = true
        exportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Padding.f20).isActive = true
        exportButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Padding.f230).isActive = true
    }
}
