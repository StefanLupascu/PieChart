//
//  PieChartCollectionViewCell.swift
//  PieChart
//
//  Created by Stefan on 12/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

class PieChartCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
        
    private let pieChartView: PieChartView = {
        let pieChart = PieChartView()
        pieChart.translatesAutoresizingMaskIntoConstraints = false
        pieChart.isUserInteractionEnabled = false
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
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        codeLabel.attributedText = LabelEditor.codeLabelText
        typeLabel.attributedText = LabelEditor.typeLabelText
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Functions

    private func setupViews() {
        backgroundColor = .clear
        
        contentView.addSubview(pieChartView)
        contentView.addSubview(codeLabel)
        contentView.addSubview(typeLabel)
        
        pieChartView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pieChartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pieChartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        pieChartView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        codeLabel.topAnchor.constraint(equalTo: pieChartView.bottomAnchor, constant: -Padding.f10).isActive = true
        codeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: -Padding.f3).isActive = true
        typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
}
