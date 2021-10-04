//
//  TRansparentUINavigation.swift
//  TestRxSwift
//
//  Created by AnDy on 24/07/2021.
//

import UIKit

class TransparentNavigation: UINavigationController {
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        trasparentNavigationBar()
        navigationBar.configureNavigationBar()
    }
    
    
    // MARK: - Transparent Navigation Bar
    private func trasparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
}

