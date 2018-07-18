//
//  DetailsViewController.swift
//  PieChart
//
//  Created by Stefan on 12/07/2018.
//  Copyright © 2018 Stefan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Properties
    
    private let detailsView = DetailsView()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "P20180002"
        
        setupViews()
    }
    
    // MARK: - Private Functions
    
    private func setupViews() {
        view.addSubview(detailsView)
        
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
