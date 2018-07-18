//
//  PieChartView.swift
//  PieChart
//
//  Created by Stefan on 11/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

class PieChartView: UIView {

    // MARK: - Properties
    
    private var percentage: CGFloat = 0.75
    private var loadingCircle = CAShapeLayer()
    private var trackingCircle = CAShapeLayer()
    
    private let projectNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let completedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let notificationLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 2
        label.backgroundColor = #colorLiteral(red: 0.2823529412, green: 0.3294117647, blue: 0.3960784314, alpha: 1)
        label.font = label.font.withSize(Padding.f11)
        label.layer.zPosition = 1
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()

        draw(percentage: percentage)
        setupUI()
        animate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        notificationLabel.isHidden = true
        let touch = touches.first
        let point = touch!.location(in: self)

        if trackingCircle.path!.contains(point) {
            notificationLabel.frame = CGRect(x: point.x - Padding.f117, y: point.y - Padding.f30, width: Padding.f117, height: Padding.f30)
            let percentageToBeDisplayed = 100*(1 - percentage)
            notificationLabel.text = LabelEditor.notificationLabelText(percentage: percentageToBeDisplayed, message: "Incomplete: ")
            notificationLabel.isHidden = false
        }

        if loadingCircle.path!.contains(point) {
                notificationLabel.frame = CGRect(x: point.x - Padding.f117, y: point.y - Padding.f30, width: Padding.f117, height: Padding.f30)
                let percentageToBeDisplayed = 100*percentage
            notificationLabel.text = LabelEditor.notificationLabelText(percentage: percentageToBeDisplayed, message: "Completed: ")
                notificationLabel.isHidden = false
            }
    
        addSubview(notificationLabel)
    }
    
    // MARK: - Private Functions
    
    private func draw(percentage: CGFloat) {
        let loadingPath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: frame.width / 2 - Padding.f20, startAngle: -CGFloat.pi / 2, endAngle: percentage * 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
//        let trackingPath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: frame.width / 2 - Padding.f20, startAngle: 2 * CGFloat.pi - CGFloat.pi / 2, endAngle: percentage * 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: false)
        let trackingPath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2), radius: frame.width / 2 - Padding.f20, startAngle: percentage * 2 * CGFloat.pi - CGFloat.pi / 2, endAngle: 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        
        loadingCircle = createCircle(color: ColorEditor.loadingCircleColor)
        trackingCircle = createCircle(color: ColorEditor.trackingCircleColor)
        
        loadingCircle.path = loadingPath.cgPath
        trackingCircle.path = trackingPath.cgPath
    }
    
    private func createCircle(color: UIColor) -> CAShapeLayer {
        let circle = CAShapeLayer()
        circle.strokeColor = color.cgColor
        circle.fillColor = UIColor.clear.cgColor
        circle.lineWidth = 33.4
        
        return circle
    }
    
    private func animate() {
        animateLoadingCircle()
        animateTrackingCircle()
    }
    
    private func animateLoadingCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = CFTimeInterval(percentage)
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        loadingCircle.add(basicAnimation, forKey: "loading")
    }
    
    private func animateTrackingCircle() {
        let trackingAnimation = CABasicAnimation(keyPath: "strokeEnd")
        trackingAnimation.toValue = 1
        trackingAnimation.duration = CFTimeInterval(1 - percentage)
        trackingAnimation.fillMode = kCAFillModeForwards
        trackingAnimation.isRemovedOnCompletion = false
        trackingAnimation.beginTime = CACurrentMediaTime() + CFTimeInterval(percentage)
        
        trackingCircle.add(trackingAnimation, forKey: "tracking")
    }
    
    private func setupUI() {
        backgroundColor = .white
        loadingCircle.strokeEnd = 0
        trackingCircle.strokeEnd = 0
        
        layer.addSublayer(trackingCircle)
        layer.addSublayer(loadingCircle)
        
        projectNumberLabel.attributedText = LabelEditor.projectNumberLabelText
        completedLabel.attributedText = LabelEditor.completedLabelText
        
        addSubview(projectNumberLabel)
        addSubview(completedLabel)
        
        projectNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        projectNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -Padding.f5).isActive = true
        completedLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        completedLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Padding.f13).isActive = true
    }

}
