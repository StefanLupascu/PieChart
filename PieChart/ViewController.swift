//
//  ViewController.swift
//  PieChart
//
//  Created by Stefan on 11/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let trackLayer = CAShapeLayer()
    let loadingLayer = CAShapeLayer()
//    let shapeLayer = CAShapeLayer()
    let contentView = UIView()
    let projects = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var completedProjects = Int()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNotificationObservers()
        setupProjects()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame.size.height = 10
        
        view.addSubview(contentView)
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi + CGFloat.pi / 2, clockwise: true)
//
//        let trackLayer = CAShapeLayer()
//        trackLayer.path = circularPath.cgPath
//        trackLayer.strokeColor = #colorLiteral(red: 0.7215686275, green: 0.6509803922, blue: 0.8039215686, alpha: 1).cgColor
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.lineWidth = 60
//        trackLayer.position = contentView.center
//
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.strokeColor = #colorLiteral(red: 0.3882352941, green: 0.1803921569, blue: 0.5098039216, alpha: 1).cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = 60
//        shapeLayer.strokeEnd = 0
//        shapeLayer.position = contentView.center
        
        trackLayer.strokeColor = #colorLiteral(red: 0.7215686275, green: 0.6509803922, blue: 0.8039215686, alpha: 1)
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 60
//        trackLayer.position = contentView.center
        
        loadingLayer.strokeColor = #colorLiteral(red: 0.3882352941, green: 0.1803921569, blue: 0.5098039216, alpha: 1)
        loadingLayer.fillColor = UIColor.clear.cgColor
        loadingLayer.lineWidth = 60
//        loadingLayer.position = contentView.center
        
//        let attributedText = NSMutableAttributedString()
//        let numberAttributedString = NSAttributedString(string: "356\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30)])
//        let completedAttributedString = NSAttributedString(string: "Completed", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
//                                                                                             NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 11)])
//        attributedText.append(numberAttributedString)
//        attributedText.append(completedAttributedString)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
//        label.attributedText = attributedText
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.layer.addSublayer(trackLayer)
//        contentView.layer.addSublayer(shapeLayer)
        contentView.layer.addSublayer(loadingLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        handleTap()
    }
    
    private func drawWith(percentage: CGFloat) {
//        let percentage = CGFloat(completedProjects)/CGFloat(projects.count)
        let trackPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: percentage * 2 * CGFloat.pi - CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        let loadingPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: percentage * 2 * CGFloat.pi - CGFloat.pi / 2, clockwise: true)
        trackLayer.path = trackPath.cgPath
        loadingLayer.path = loadingPath.cgPath
        
//        trackLayer.position = contentView.center
//        loadingLayer.position = contentView.center
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: .UIApplicationWillEnterForeground, object: nil)
    }

    @objc private func handleEnterForeground() {
        animate()
    }
    
    @objc private func handleTap() {
        let index = Int(arc4random_uniform(UInt32(projects.count)))
        completedProjects = projects[index]
        let attributedText = NSMutableAttributedString()
        let numberAttributedString = NSAttributedString(string: "\(completedProjects)/\(projects.count)\n", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30)])
        let completedAttributedString = NSAttributedString(string: "Completed", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray,
                                                                                             NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 11)])
        attributedText.append(numberAttributedString)
        attributedText.append(completedAttributedString)
        label.attributedText = attributedText
        
        animate()
    }
    
    private func animate() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        let percentage = CGFloat(completedProjects)/CGFloat(projects.count)
        drawWith(percentage: percentage)
        basicAnimation.toValue = percentage
        basicAnimation.duration = CFTimeInterval(percentage) + 0.3
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        //shapeLayer.add(basicAnimation, forKey: "progress")
    }
    
    private func setupProjects() {
        let index = Int(arc4random_uniform(UInt32(projects.count)))
        completedProjects = projects[index]
    }

}

